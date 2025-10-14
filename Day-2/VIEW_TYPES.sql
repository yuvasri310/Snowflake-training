CREATE OR REPLACE TABLE SALES(id int,customer_name string,region string,amount number(10,2),sale_date date);

insert into sales values(
1,'kavya','west',4500.00,'2025-06-04'),
(
2,'ram','sothwest',4500.00,'2010-06-03'),(
3,'arun','south',2500.00,'2020-10-07'),(
4,'theshi','north',34500.00,'2025-11-04'),(
5,'nilla','west',46700.00,'2018-07-19');

CREATE OR REPLACE VIEW SALES_VIEW AS
select region,sum(amount) as total_sales,count(*) as total_transactions from sales group by region;

select * from sales_view;

CREATE OR REPLACE SECURE  VIEW SECURE_VIEW AS 
SELECT 
CUSTOMER_NAME,
REGION,
CASE
    WHEN REGION='east' THEN '*****MASKED*****'
    ELSE TO_VARCHAR(AMOUNT)
END AS AMOUNT_DISPLAY
FROM SALES;

select * from secure_view;

create or replace materialized view my_sales_summary as select region,sum(amount) as total_sales,count(*) as txt_count from sales group by region;

select * from my_sales_summary;

insert into sales values(
1,'reetha','east',6000.00,'2024-09-08');



