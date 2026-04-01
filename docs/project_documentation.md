# 📊 End-to-End Azure Data Engineering Project Documentation

---

## 📌 1. Introduction

This project demonstrates the design and implementation of a modern data engineering pipeline using Azure services. The objective is to build a scalable and modular architecture that ingests, processes, and analyzes global weather data for world capital cities.

---

## 🎯 2. Objectives

- Build an end-to-end data pipeline using Azure services  
- Implement a Bronze-Silver-Gold architecture  
- Perform data transformations using PySpark  
- Design a star schema for analytical queries  
- Visualize insights using Power BI  

---

## 🧱 3. Architecture Overview

GitHub Dataset
→ Azure Data Factory
→ ADLS Gen2 (Bronze Layer)
→ Azure Databricks
→ ADLS Gen2 (Silver Layer)
→ Azure Synapse Serverless SQL
→ Power BI Dashboard


---

## 🛠️ 4. Technology Stack

- Azure Data Factory (ADF) – Data ingestion  
- Azure Data Lake Storage Gen2 (ADLS) – Storage  
- Azure Databricks – Data transformation (PySpark)  
- Azure Synapse Analytics (Serverless SQL) – Data modeling & querying  
- Power BI – Data visualization  
- GitHub – Version control  

---

## 📂 5. Data Description

The dataset contains daily weather data for capital cities worldwide, including:

- Country and capital  
- Latitude and longitude  
- Temperature metrics (min, max, mean)  
- Precipitation (rain, snow)  
- Wind and radiation metrics  

---

## 🔄 6. Pipeline Design

### 6.1 Data Ingestion (ADF)

- Data is sourced from GitHub using HTTP linked service  
- A metadata-driven approach is used via `export.json`  
- Lookup + ForEach activities dynamically ingest multiple files  
- Data is stored in ADLS Bronze layer  

---

### 6.2 Bronze Layer

- Stores raw data as-is  
- No transformations applied  
- Serves as source of truth  

---

### 6.3 Data Transformation (Databricks)

- Data is read from Bronze layer  
- Transformations applied:
  - Data type casting  
  - Null handling  
  - Column standardization  
  - Derived column (`temp_range`)  

- Cleaned data is exported and stored in Silver layer  

---

### 6.4 Silver Layer

- Contains cleaned and structured datasets  
- Stored in Parquet format  
- Ready for analytical modeling  

---

### 6.5 Data Modeling (Synapse)

- Serverless SQL used to query Silver layer  
- Star schema implemented:

#### Dimension Tables:
- `dim_location` – country, capital, coordinates  
- `dim_date` – date attributes (year, month, day, etc.)

#### Fact Table:
- `fact_weather_daily` – weather metrics  

---

### 6.6 Gold Layer

Analytical views created for reporting:

- `gold_country_weather_summary`  
- `gold_monthly_country_weather`  
- `gold_hottest_day_by_country`  

These views provide aggregated insights for Power BI.

---

## 📊 7. Data Visualization (Power BI)

- Connected to Synapse Serverless SQL using DirectQuery  
- Dashboard includes:
  - Average temperature by country  
  - Rainfall comparison  
  - Monthly trends  
  - Extreme weather analysis  
  - KPI metrics  

---

## 🔄 8. Metadata-Driven Design

A JSON file (`export.json`) controls ingestion:

- Source file paths  
- Sink locations  
- File formats  

Benefits:
- Scalable pipeline  
- Easy addition of new datasets  
- Reduced hardcoding  

---

## ⚠️ 9. Limitations

- Direct Databricks to ADLS integration via Microsoft Entra ID was restricted  
- Data was staged locally before uploading to ADLS  
- No incremental loading implemented  

---

## 🔧 10. Future Improvements

- Implement incremental data loading (watermarking)  
- Use Delta Lake for ACID transactions  
- Automate Gold layer storage using CETAS  
- Implement CI/CD pipelines  
- Add data quality validation checks  

---

## 💼 11. Conclusion

This project successfully demonstrates an end-to-end data engineering pipeline using Azure services, covering ingestion, transformation, modeling, and visualization. It reflects real-world practices such as layered architecture, metadata-driven pipelines, and analytical data modeling.

---
