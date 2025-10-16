CREATE OR REPLACE STAGE azure_stage
  url='azure://yuvasristorage.blob.core.windows.net/datafiles'
  credentials=(AZURE_SAS_TOKEN='sv=2024-11-04&ss=bfqt&srt=co&sp=rwdlacupiytfx&se=2025-10-25T13:54:41Z&st=2025-10-15T05:39:41Z&spr=https&sig=C87l0BT0SW38TD5IcSSWNxFLjr5l17VkqqPo11mmADo%3D');

CREATE OR REPLACE TABLE sales_data (
  order_id STRING,
  amount NUMBER,
  region STRING
);

COPY INTO sales_data
FROM @azure_stage/sales_oct.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);

CREATE OR REPLACE PIPE azure_sales_pipe
AS
COPY INTO sales_data
FROM @azure_stage
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);

SELECT * FROM PUBLIC.SALES_DATA;

