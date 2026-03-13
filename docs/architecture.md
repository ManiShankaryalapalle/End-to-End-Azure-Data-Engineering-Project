# End-to-End Azure Data Engineering Architecture

## Overview

This project demonstrates an end-to-end data engineering pipeline built on Microsoft Azure using a global weather dataset.

The pipeline ingests raw weather data, processes it using distributed data processing tools, and serves analytics-ready data for visualization.

## Architecture Flow

GitHub Raw Dataset → Azure Data Factory → Azure Data Lake Gen2 (Bronze) → Azure Databricks → Azure Data Lake Gen2 (Silver) → Synapse Serverless SQL → Power BI

## Components

### Source Layer
The raw dataset is stored in the GitHub repository under `data/raw/`.  
This dataset contains daily weather observations for global capital cities.

### Ingestion Layer
Azure Data Factory is used to orchestrate the ingestion process.  
It copies the raw files from the source repository into Azure Data Lake Storage Gen2.

### Bronze Layer
The Bronze layer stores raw ingested files without any transformation.

Example structure:

bronze/weather_data/

### Transformation Layer
Azure Databricks performs data transformation tasks including:

- schema standardization
- null handling
- data cleansing
- derived feature creation

### Silver Layer
The Silver layer contains cleaned and structured datasets suitable for analytics.

Example structure:

silver/weather_data/

### Serving Layer
Azure Synapse Serverless SQL queries the curated data directly from ADLS Gen2 and exposes analytical views.

### Visualization Layer
Power BI connects to Synapse views to build dashboards and perform analytics on the weather dataset.

## Medallion Architecture

The pipeline follows the Medallion architecture pattern:

Bronze → Raw data  
Silver → Cleaned and structured data  
Gold → Analytics-ready datasets