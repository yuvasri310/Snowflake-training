USE MY_PRACTICE_DB;
CREATE OR REPLACE SCHEMA MY_PRACTICE_DB.MY_SCHEMA;

CREATE OR REPLACE TABLE SALES_DATA(sale_id int,amount number(10,2));

create or replace transient table sles_stage(sal_id int,region string);

create or replace temporary table sales_temp(
sales_id int,
discount number(5,2));

show tables in schema my_practice_db.my_schema;

ALTER TABLE SALES_DATA SET DATA_RETENTION_TIME_IN_DAYS=7;

SELECT * FROM SALES_DATA;
INSERT INTO SALES_DATA VALUES(1,'999.00');

DROP TABLE SALES_DATA;

UNDROP TABLE SALES_DATA;

SELECT * FROM SALES_DATA;





