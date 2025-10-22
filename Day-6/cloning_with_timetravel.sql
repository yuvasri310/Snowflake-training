CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.time_travel (
   id INT,
   first_name STRING,
   last_name STRING,
   email STRING,
   gender STRING,
   job STRING,
   phone STRING
);

CREATE OR REPLACE FILE FORMAT MANAGE_DB.file_formats.csv_file
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1;

CREATE OR REPLACE STAGE MANAGE_DB.external_stages.time_travel_stage
    URL = 's3://data-snowflake-fundamentals/time-travel/'
    FILE_FORMAT = MANAGE_DB.file_formats.csv_file;

LIST @MANAGE_DB.external_stages.time_travel_stage;

COPY INTO OUR_FIRST_DB.PUBLIC.time_travel
FROM @MANAGE_DB.external_stages.time_travel_stage
FILES = ('customers.csv');

SELECT * FROM OUR_FIRST_DB.PUBLIC.time_travel;


UPDATE OUR_FIRST_DB.PUBLIC.time_travel
SET FIRST_NAME = 'Frank';

SELECT * 
FROM OUR_FIRST_DB.PUBLIC.time_travel 
AT (OFFSET => -60*1);

CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.time_travel_clone
CLONE OUR_FIRST_DB.PUBLIC.time_travel AT (OFFSET => -60*1.5);

UPDATE OUR_FIRST_DB.PUBLIC.time_travel_clone
SET JOB = 'Snowflake Analyst';

SELECT * 
FROM OUR_FIRST_DB.PUBLIC.time_travel_clone 
BEFORE (STATEMENT => '<your-query-id>');

SELECT * FROM OUR_FIRST_DB.PUBLIC.time_travel_clone_of_clone;