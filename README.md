# # 🌦️ Climate_Analysis_Cloud

## 📜 Project Overview
**Climate_Analysis_Cloud** is an end-to-end data pipeline and analytics project that explores agricultural climate data — including rainfall, temperature, humidity, and yield — to discover trends and actionable insights.

This project integrates **AWS S3**, **IAM**, **Snowflake**, and **Power BI** to:
- Ingest and store raw data on the cloud.
- Transform data using SQL in Snowflake.
- Visualize results using interactive Power BI dashboards.

---

## 🧰 Tech Stack
- **AWS S3** — Raw data ingestion & cloud storage
- **AWS IAM** — Role and trust policy setup
- **Snowflake** — Cloud data warehouse and SQL transformations
- **ODBC** — Snowflake to Power BI connection
- **Power BI** — Interactive dashboard creation

---

## 📂 Folder Structure
Climate_Analysis_Cloud/

 **data/**
│   └── raw_data.csv

 **power_bi/**
│   ├── Climate_Analysis.pbix
│   ├── screenshots/
│   │   ├── rainfall_dashboard.png
│   │   ├── temperature_dashboard.png
│   │   ├── humidity_dashboard.png
│   │   ├── yield_dashboard.png

**snowflake/**
│   ├── snowflake_queries.sql
│   ├── integration_setup.md
├── README.md


---

## ⚙️ Steps Implemented
1. ✅ Uploaded raw datasets to **AWS S3** (`powerbi.1project` bucket).  
2. ✅ Created an **IAM role** with S3 read permissions.  
3. ✅ Configured **Snowflake Storage Integration** (`PBI_Integration`).  
4. ✅ Created a Snowflake database, schema, and target table (`Power_Dataset`).  
5. ✅ Loaded data into Snowflake using `COPY INTO`.  
6. ✅ Connected Power BI to Snowflake via **ODBC**.  
7. ✅ Developed 4 interactive Power BI dashboards:
   - 🌧️ Rainfall Analysis
   - 🌡️ Temperature Analysis
   - 💧 Humidity Analysis
   - 🌾 Yield Analysis  
8. ✅ Added KPIs and filters for Year, Season, and Crop Type.

---

## 🖼️ Screenshots
#### S3 Data Storage
Here’s a preview of the uploaded CSVs in S3:

![AWS s3 bucket](https://github.com/user-attachments/assets/5d8ac9f0-5989-41ca-b5ad-230254447292)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### Power BI Dashboard Screenshot
Here’s one of the dashboards:


![Rainfall Analysis Dashboard](https://github.com/user-attachments/assets/0ebeccc3-8b01-4e28-a4b7-127ff7815cc8)



## 📊 Insights
- 📍 Seasonal & crop-wise variations in rainfall and temperature.  
- 📍 Yield patterns across soil types and irrigation methods.  
- 📍 Interactive KPIs enable quick summary comparisons by Year, Season, and Crop.  
- 📍 Provides actionable insights for agricultural stakeholders and planners.

---



