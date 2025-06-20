# 📂 S3–Snowflake Integration Setup Steps

## ✅ Step 1 — Create External Storage Integration
Run this SQL to create the integration object:
```sql
CREATE OR REPLACE STORAGE INTEGRATION PBI_Integration
    TYPE=EXTERNAL_STAGE
    STORAGE_PROVIDER='s3'
    ENABLED=TRUE
    STORAGE_AWS_ROLE_ARN='arn:aws:iam::835456546822:role/powerbi.role'
    STORAGE_ALLOWED_LOCATIONS=('s3://powerbi.1project/')
    COMMENT='Integration for Power BI project';

----------------------------------------------------------------------------------------------------------------------------------------

-- 🔍 Step 2: Verify integration
DESC INTEGRATION PBI_Integration;




----------------------------------------------------------------------------------------------------------------------------------------

-- 🗄️ Step 3: Create database
CREATE DATABASE PowerBI;





----------------------------------------------------------------------------------------------------------------------------------------



-- 📂 Step 4: Create schema
CREATE SCHEMA PBI_Data;



----------------------------------------------------------------------------------------------------------------------------------------



-- 🧮 Step 5: Create target table
CREATE TABLE Power_Dataset (
    Year INT,
    Location STRING,
    Area INT,
    Rainfall FLOAT,
    Temperature FLOAT,
    Soil_type STRING,
    Irrigation STRING,
    Yields INT,
    Humidity FLOAT,
    Crops STRING,
    Price INT,
    Season STRING
);

----------------------------------------------------------------------------------------------------------------------------------------


## ✅ Step 6 — Create External Stage

Create an external stage in Snowflake pointing to your S3 bucket:
```sql
CREATE OR REPLACE STAGE POWERBI.PBI_Data.pbi_stage
    URL='s3://powerbi.1project'
    STORAGE_INTEGRATION=PBI_Integration;


----------------------------------------------------------------------------------------------------------------------------------------


## ✅ Step 7 — Load Data Into Snowflake Table

Copy data from the external stage into the `Power_Dataset` table:
```sql
COPY INTO Power_Dataset
FROM @POWERBI.PBI_Data.pbi_stage
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

