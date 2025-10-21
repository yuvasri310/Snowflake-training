CREATE OR REPLACE TRANSIENT DATABASE STREAMS_DB;

-- Create example table 
create or replace table sales_raw_staging(
  id varchar,
  product varchar,
  price varchar,
  amount varchar,
  store_id varchar);
  
-- insert values 
insert into sales_raw_staging 
    values
        (1,'Banana',1.99,1,1),
        (2,'Lemon',0.99,1,1),
        (3,'Apple',1.79,1,2),
        (4,'Orange Juice',1.89,1,2),
        (5,'Cereals',5.98,2,1);  


create or replace table store_table(
  store_id number,
  location varchar,
  employees number);


INSERT INTO STORE_TABLE VALUES(1,'Chicago',33);
INSERT INTO STORE_TABLE VALUES(2,'London',12);

create or replace table sales_final_table(
  id int,
  product varchar,
  price number,
  amount int,
  store_id int,
  location varchar,
  employees int);

  
insert into sales_final_table
select 
SA.id,
SA.product,
SA.price,
SA.amount,
ST.store_id,
ST.location,
ST.employees
from sales_raw_staging SA
join store_table ST on ST.store_id=sa.store_id;

create or replace stream sales_stream on table sales_raw_staging;


show streams;

desc stream sales_stream;


insert into sales_raw_staging 
    values
        (6,'Mango',1.99,1,2),
        (7,'Garlic',0.99,1,1);
        
 select * from sales_stream;

 select * from sales_raw_staging;

 insert into sales_final_table
select 
SA.id,
SA.product,
SA.price,
SA.amount,
ST.store_id,
ST.location,
ST.employees
from sales_raw_staging SA
join store_table ST on ST.store_id=sa.store_id;

 select * from  sales_final_table;

 insert into sales_raw_staging  
    values
        (8,'Paprika',4.99,1,2),
        (9,'Tomato',3.99,1,2);
        