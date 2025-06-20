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
```

![Screenshot 2025-06-20 190357](https://github.com/user-attachments/assets/cbf8d770-1006-4bc8-9be6-9875850b48e9)

----------------------------------------------------------------------------------------------------------------------------------------

## 🔍 Step 2: Verify integration

```DESC INTEGRATION PBI_Integration;```


![Screenshot 2025-06-20 200734](https://github.com/user-attachments/assets/96e5020a-716c-4bbd-adb7-3ad311c5fc65)


----------------------------------------------------------------------------------------------------------------------------------------

## 🗄️ Step 3: Create database

```CREATE DATABASE PowerBI;```


![Screenshot 2025-06-20 200835](https://github.com/user-attachments/assets/a324acc3-e619-44d1-8002-76252b765793)



----------------------------------------------------------------------------------------------------------------------------------------



##📂 Step 4: Create schema

```CREATE SCHEMA PBI_Data;```


![Screenshot 2025-06-20 200901](https://github.com/user-attachments/assets/abba4d14-9e07-4650-9160-c05313f46f40)

----------------------------------------------------------------------------------------------------------------------------------------



## 🧮 Step 5: Create target table

```CREATE TABLE Power_Dataset (
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
```

![Screenshot 2025-06-20 200927](https://github.com/user-attachments/assets/8744124e-e7ce-435c-9f0b-da872633cbce)

----------------------------------------------------------------------------------------------------------------------------------------


## ✅ Step 6 — Create External Stage

Create an external stage in Snowflake pointing to your S3 bucket:

```sql
CREATE OR REPLACE STAGE POWERBI.PBI_Data.pbi_stage
    URL='s3://powerbi.1project'
    STORAGE_INTEGRATION=PBI_Integration;
```


![Screenshot 2025-06-20 200936](https://github.com/user-attachments/assets/faf6d3ed-d823-4f59-9e1f-2aa856d4cf30)

----------------------------------------------------------------------------------------------------------------------------------------


## ✅ Step 7 — Load Data Into Snowflake Table

Copy data from the external stage into the `Power_Dataset` table:
```sql
COPY INTO Power_Dataset
FROM @POWERBI.PBI_Data.pbi_stage
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';
```

![Screenshot 2025-06-20 200944](https://github.com/user-attachments/assets/53a59570-e653-45cb-983b-ae1173c01f06)

------------------------------------------------------------------------------------------------------------------
