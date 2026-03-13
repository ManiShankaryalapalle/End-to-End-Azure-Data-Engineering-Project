# End-to-End Azure Data Engineering Project

## Project Overview

This project demonstrates an end-to-end Azure data engineering pipeline built using a global weather dataset for world capital cities.

The solution is designed to simulate a modern cloud-based data platform using Azure services for ingestion, storage, transformation, serving, and reporting.

## Architecture

GitHub Raw Dataset → Azure Data Factory → Azure Data Lake Gen2 (Bronze) → Azure Databricks → Azure Data Lake Gen2 (Silver) → Synapse Serverless SQL → Power BI

## Technology Stack

- GitHub
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Azure Databricks
- Azure Synapse Analytics (Serverless SQL)
- Power BI

## Data Layers

### Bronze Layer
Raw files ingested from the source and stored without transformation.

### Silver Layer
Cleaned and transformed datasets prepared using Databricks.

### Gold Layer
Business-ready analytical views exposed through Synapse Serverless SQL.

## Repository Structure

- `data/raw/` → source dataset files
- `docs/` → project documentation
- `adf/` → Azure Data Factory assets
- `databricks/` → transformation notebooks/scripts
- `synapse/` → SQL scripts and views
- `powerbi/` → dashboard assets
- `screenshots/` → project screenshots

## Project Status

- Repository initialized
- Raw dataset added
- Architecture document created
- Azure implementation in progress
