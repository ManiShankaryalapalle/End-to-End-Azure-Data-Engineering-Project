# End-to-End Azure Data Engineering & Analytics Project

## 🚀 Project Overview

This project demonstrates the design and implementation of an end-to-end Azure data engineering pipeline using a global weather dataset for world capital cities.

The solution simulates a modern cloud-based data platform by integrating multiple Azure services for data ingestion, storage, transformation, modeling, and visualization using a Bronze-Silver-Gold architecture.

---

## 🧱 Architecture

GitHub Raw Dataset  
→ Azure Data Factory  
→ Azure Data Lake Gen2 (Bronze)  
→ Azure Databricks  
→ Azure Data Lake Gen2 (Silver)  
→ Azure Synapse Serverless SQL (Gold Layer)  
→ Power BI Dashboard  

---

## 🛠️ Technology Stack

- GitHub  
- Azure Data Factory  
- Azure Data Lake Storage Gen2  
- Azure Databricks (PySpark)  
- Azure Synapse Analytics (Serverless SQL)  
- Power BI  

---

## 📊 Data Layers

### 🥉 Bronze Layer
- Raw dataset ingested from GitHub  
- Stored in ADLS Gen2 without transformations  

---

### 🥈 Silver Layer
- Data cleaning and transformation using Databricks (PySpark)  
- Handling data types, nulls, and derived columns  
- Example transformations:
  - temperature normalization  
  - derived metrics (e.g., temperature range)  
  - data standardization  

---

### 🥇 Gold Layer
- Star schema modeling implemented in Synapse  
- Fact and dimension views created for analytics:
  - `dim_location`
  - `dim_date`
  - `fact_weather_daily`

- Aggregated analytical views:
  - `gold_country_weather_summary`
  - `gold_monthly_country_weather`
  - `gold_hottest_day_by_country`

---

## 🔄 Metadata-Driven Pipeline

The ingestion process is controlled using a JSON configuration file:

- `data/metadata/export.json`

This file dynamically defines:
- source file paths  
- sink locations  
- file formats  

This enables:
- scalable pipeline design  
- reusable ingestion logic  
- easy extension for new datasets  

---

## 📁 Repository Structure
