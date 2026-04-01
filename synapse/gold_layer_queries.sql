CREATE DATABASE deprojectdb;
GO

USE deprojectdb;
GO

Create or alter VIEW vw_silver_capitals as 
select 
        country,
        country_code,
        capital,
        lat,
        lon
from OPENROWSET(
    BULK 'abfss://silver@deprojectstoragedatalake.dfs.core.windows.net/capitals/part-00000-tid-6483462714467265009-88bc2ec5-717c-4c73-8e77-60927307383f-22-1-c000.snappy.parquet',
    format = 'PARQUET'
) AS ROWS;
GO

CREATE OR ALTER VIEW vw_silver_history AS
SELECT
    CAST([date] AS date) AS weather_date,
    country,
    country_alpha2,
    capital,
    CAST(lat AS float) AS lat,
    CAST(lon AS float) AS lon,
    CAST(temp_min AS float) AS temp_min,
    CAST(temp_max AS float) AS temp_max,
    CAST(temp_mean AS float) AS temp_mean,
    CAST(feels_like_min AS float) AS feels_like_min,
    CAST(feels_like_max AS float) AS feels_like_max,
    CAST(precip_mm AS float) AS precip_mm,
    CAST(rain_mm AS float) AS rain_mm,
    CAST(snow_mm AS float) AS snow_mm,
    CAST(windspeed_10m_max_kmh AS float) AS windspeed_10m_max_kmh,
    CAST(windgusts_10m_max_kmh AS float) AS windgusts_10m_max_kmh,
    CAST(wind_dir_dom_deg AS float) AS wind_dir_dom_deg,
    CAST(sunshine_duration_s AS float) AS sunshine_duration_s,
    CAST(daylight_duration_s AS float) AS daylight_duration_s,
    CAST(shortwave_radiation_MJ_m2 AS float) AS shortwave_radiation_MJ_m2,
    CAST(temp_range AS float) AS temp_range
FROM OPENROWSET(
    BULK 'abfss://silver@deprojectstoragedatalake.dfs.core.windows.net/history_combined/*.parquet',
    FORMAT = 'PARQUET'
) AS rows;
GO

SELECT TOP 5 * FROM vw_silver_capitals;
SELECT TOP 5 * FROM vw_silver_history;

CREATE OR ALTER VIEW dim_location AS
SELECT DISTINCT
    country,
    country_code,
    capital,
    ROUND(CAST(lat AS float), 2) AS lat,
    ROUND(CAST(lon AS float), 2) AS lon
FROM vw_silver_capitals;
GO

CREATE OR ALTER VIEW dim_date AS
SELECT DISTINCT
    weather_date,
    YEAR(weather_date) AS calendar_year,
    MONTH(weather_date) AS calendar_month,
    DAY(weather_date) AS calendar_day,
    DATENAME(month, weather_date) AS month_name,
    DATEPART(quarter, weather_date) AS calendar_quarter,
    DATENAME(weekday, weather_date) AS day_name,
    CASE 
        WHEN DATENAME(weekday, weather_date) IN ('Saturday', 'Sunday') THEN 1
        ELSE 0
    END AS is_weekend,
    FORMAT(weather_date, 'yyyy-MM') AS year_month

FROM vw_silver_history;
GO

CREATE OR ALTER VIEW fact_weather_daily AS
SELECT
    weather_date,
    country,
    capital,
    temp_min,
    temp_max,
    temp_mean,
    feels_like_min,
    feels_like_max,
    ROUND(temp_range, 2) AS temp_range,
    precip_mm,
    rain_mm,
    snow_mm,
    windspeed_10m_max_kmh,
    windgusts_10m_max_kmh,
    wind_dir_dom_deg,
    sunshine_duration_s,
    daylight_duration_s,
    shortwave_radiation_MJ_m2,
    CASE 
        WHEN temp_mean >= 30 THEN 'Hot'
        WHEN temp_mean >= 15 THEN 'Mild'
        ELSE 'Cold'
    END AS weather_category,
    CASE 
        WHEN rain_mm > 0 THEN 1
        ELSE 0
    END AS is_rainy_day
FROM vw_silver_history;
GO

SELECT TOP 10 * FROM dim_location;
SELECT TOP 10 * FROM dim_date;
SELECT TOP 10 * FROM fact_weather_daily;

CREATE OR ALTER VIEW gold_country_weather_summary AS
SELECT
    country,
    AVG(temp_mean) AS avg_temp_mean,
    AVG(temp_range) AS avg_temp_range,
    SUM(rain_mm) AS total_rain_mm,
    SUM(snow_mm) AS total_snow_mm,
    AVG(windspeed_10m_max_kmh) AS avg_windspeed_kmh,
    AVG(shortwave_radiation_MJ_m2) AS avg_radiation_mj_m2
FROM fact_weather_daily
GROUP BY country;
GO

CREATE OR ALTER VIEW gold_monthly_country_weather AS
SELECT
    YEAR(weather_date) AS calendar_year,
    MONTH(weather_date) AS calendar_month,
    country,
    AVG(temp_mean) AS avg_temp_mean,
    SUM(rain_mm) AS total_rain_mm,
    SUM(snow_mm) AS total_snow_mm,
    AVG(windspeed_10m_max_kmh) AS avg_windspeed_kmh
FROM fact_weather_daily
GROUP BY
    YEAR(weather_date),
    MONTH(weather_date),
    country;
GO

CREATE OR ALTER VIEW gold_hottest_day_by_country AS
WITH ranked AS (
    SELECT
        weather_date,
        country,
        capital,
        temp_max,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY temp_max DESC, weather_date ASC
        ) AS rn
    FROM fact_weather_daily
)
SELECT
    weather_date,
    country,
    capital,
    temp_max
FROM ranked
WHERE rn = 1;
GO

SELECT TOP 20 * FROM gold_country_weather_summary ORDER BY avg_temp_mean DESC;
SELECT TOP 20 * FROM gold_monthly_country_weather ORDER BY calendar_year, calendar_month, country;
SELECT TOP 20 * FROM gold_hottest_day_by_country ORDER BY temp_max DESC;