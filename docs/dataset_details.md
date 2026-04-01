# 🌍 Global Capitals Weather Dataset (2025)

**Daily weather statistics for world capital cities**

_Auto-updated via Open-Meteo_

---

## 📊 About Dataset

**Dataset Name:** Global Capitals Daily Weather  
**Source:** Kaggle  
**License:** CC BY 4.0  

---

## 📌 Overview

This dataset provides **daily weather summaries for national capital cities worldwide**, sourced from Open-Meteo and published via Kaggle.

Each record represents:

**One capital city × one day**

The dataset includes:

- Temperature metrics  
- Precipitation values  
- Wind data  
- Solar radiation and daylight duration  

---

## 🔄 Usage in This Project

This dataset serves as the **primary data source** for the Azure data engineering pipeline.

It is used across multiple layers:

- **Bronze Layer** → Raw ingestion from GitHub  
- **Silver Layer** → Cleaned and transformed using Databricks  
- **Gold Layer** → Aggregated views in Synapse for analytics  

---

## 📂 Files

| File | Description |
|------|------------|
| `history.parquet` | Full historical dataset (all cities × all days) |
| `history_latest.csv` | Latest day's snapshot |
| `capitals_clean.parquet` | Reference dataset with country codes and coordinates |

---

## 🧩 Schema

### Applicable to:
- `history.parquet`
- `history_latest.csv`

| Column | Type | Units | Description |
|-------|------|------|------------|
| date | string (YYYY-MM-DD) | — | Observation date (UTC) |
| country | string | — | Country name |
| country_alpha2 | string | — | ISO-3166-1 alpha-2 code |
| capital | string | — | Capital city |
| lat, lon | float | degrees | Coordinates |
| temp_min_c, temp_max_c, temp_mean_c_approx | float | °C | Temperature metrics |
| app_temp_min_c, app_temp_max_c | float | °C | Apparent temperatures |
| precip_mm, rain_mm, snow_mm | float | mm | Precipitation values |
| windspeed_10m_max_kmh, windgusts_10m_max_kmh | float | km/h | Wind speed and gusts |
| wind_dir_dom_deg | float | degrees | Dominant wind direction |
| sunshine_duration_s, daylight_duration_s | float | seconds | Sunlight duration |
| shortwave_radiation_MJ_m2 | float | MJ/m² | Solar radiation |

---

## 🔄 Update Process (Source Dataset)

- Data collected via Kaggle notebook  
- Updated daily (~06:00 UTC)  
- Appends new records to historical dataset  

⚠️ Note:
- Dataset is already processed (no raw API data available)  
- Used as input for downstream transformation  

---

## 🌐 Data Sources

- Weather data: Open-Meteo (CC BY 4.0)  
- Capital coordinates: Wikidata (CC0 1.0)  

---

## ⚖️ License & Attribution

This dataset is released under:

**Creative Commons Attribution 4.0 International (CC BY 4.0)**

### Attribution:
- Weather data © Open-Meteo  
- Capital metadata © Wikidata contributors  
- Compiled and processed by: **wafaaelhusseini**  

---

## 🔗 Source Link


👉 https://www.kaggle.com/datasets/wafaaelhusseini/daily-global-capitals-weather-data

