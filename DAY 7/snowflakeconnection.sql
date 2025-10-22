CREATE OR REPLACE DATABASE RETAIL_DB;
USE DATABASE RETAIL_DB;
CREATE SCHEMA SALES_SCHEMA;
USE SCHEMA SALES_SCHEMA;

CREATE OR REPLACE STAGE azure_stage_sales
URL='azure://yuastorage.blob.core.windows.net/yuvacontainer'
CREDENTIALS=(AZURE_SAS_TOKEN='sv=2024-11-04&ss=bfqt&srt=sc&sp=rwdlacupiytfx&se=2025-10-25T17:37:29Z&st=2025-10-22T09:22:29Z&spr=https&sig=hrEpzsXQ2buMqseVSEItq8QKC9%2FAs7LOM13sw5usrmw%3D');

LIST @azure_stage_sales;CREATE OR REPLACE TABLE retail_sales (
    OrderID STRING,
    OrderDate STRING,
    MonthOfSale STRING,
    CustomerID STRING,
    CustomerName STRING,
    Country STRING,
    Region STRING,
    City STRING,
    Category STRING,
    Subcategory STRING,
    Quantity INT,
    Discount FLOAT,
    Sales FLOAT,
    Profit FLOAT
);

SELECT * FROM retail_sales;