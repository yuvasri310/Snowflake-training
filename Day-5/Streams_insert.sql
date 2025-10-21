CREATE OR REPLACE TRANSIENT DATABASE STREAMS_DB;

CREATE OR REPLACE TABLE SAES_RAW_STAGING(
ID number,
PRODUCT VARCHAR,
PRICE number,
AMOUNT number,
STORE_ID number);
 
 
INSERT INTO SAES_RAW_STAGING
VALUES
(1,'Banana',1.99,1,1),
(2,'Lemon',0.99,1,1),
(3,'Apple',1.79,1,2),
(4,'Orange',1.99,1,2),
(5,'cerals',6,2,1);
 
 
create or replace table store_table
(store_id number,
location varchar,
employees number);
 
 
insert into store_table values (1,'chicago',33);
insert into store_table values(2,'London',12);
 
 
create or replace table sales_final_table(
id int,product varchar,price number,amount number,store_id number,locaion varchar,employees number);