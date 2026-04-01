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

data/
raw/ → source dataset files
metadata/ → pipeline configuration (export.json)

docs/ → project documentation

adf/ → Azure Data Factory pipelines (ARM templates)

databricks/ → PySpark transformation notebooks

synapse/ → SQL scripts (views, star schema, gold layer)

powerbi/ → Power BI dashboard (.pbix)

screenshots/ → pipeline and dashboard visuals

---

## 📸 Project Screenshots

(Add images here once uploaded)

- ADF Pipeline  
- Databricks Transformations  
- Synapse SQL Modeling  
- Power BI Dashboard  

---

## ⚠️ Limitations
### 🔐 Data Access Design (Production vs Project)

Due to tenant-level access limitations, direct Databricks to ADLS integration using Microsoft Entra ID was not feasible.

In this implementation:
- Data was staged locally after transformation
- Uploaded manually to ADLS Silver layer

In a production environment:
- Managed Identity or Service Principal would be used
- Direct ABFS-based read/write would be implemented

---

## 🔧 Future Improvements

- Implement incremental data loading (watermarking)  
- Use Delta Lake for upserts and versioning  
- Materialize Gold layer into ADLS using CETAS  
- Add CI/CD pipeline using Azure DevOps  

---

## 📊 Dataset

Detailed dataset information available here:  
👉 [Dataset Documentation](docs/dataset_details.md)
