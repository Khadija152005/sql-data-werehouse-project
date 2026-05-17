USE master;
create database DataWarehouse;
use DataWarehouse;

create schema bronze;
go
create schema silver;
go
create schema gold;
go

===============

USE master;
GO

IF DB_ID('DataWarehouse') IS NULL
    CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

create schema bronze;
go

create schema silver;
go

create schema gold;
go


if OBJECT_ID('bronze.crm_cust_info','u') is not null
drop table bronze.crm_cust_info;

create table bronze.crm_cust_info(
 cst_id int,
 cst_key nvarchar(50),
 cst_firstname nvarchar(50),
 cst_lastname nvarchar(50),
 cst_material_status nvarchar(50),
 cst_gndr nvarchar(50),
 cst_create_date date
);
if OBJECT_ID('bronze.crm_ptd_info','u') is not null
  drop table bronze.crm_ptd_info;
create table bronze.crm_ptd_info(
 prd_id   int,
 prd_key  nvarchar(50),
 prd_nm   nvarchar(50),
 prd_cost int,
 prd_line nvarchar(50),
 prd_start_dt datetime,
 prd_end_dt datetime
);

if OBJECT_ID('bronze.crm_sales_detalis','u') is not null
  drop table bronze.crm_sales_detalis;
create table bronze.crm_sales_detalis(
sls_ord_num nvarchar(50),
sls_prd_key  nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_saler int,
sls_price int
);
if OBJECT_ID('bronze.erp_loc_a101','u') is not null
  drop table bronze.erp_loc_a101;
create table bronze.erp_loc_a101( 
 cid nvarchar(50),
 cntry nvarchar(50)

);

if OBJECT_ID('bronze.erp_cust_az12','u') is not null
  drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12(
 cid nvarchar(50),
 bdate date,
 gen nvarchar(50)

);
if OBJECT_ID('bronze.erp_px_cat_g1v2','u') is not null
  drop table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2(
  id nvarchar(50),
  cat nvarchar(50),
  subcat nvarchar(50),
  maintenance nvarchar(50)
);


truncate table bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\khadi\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM bronze.crm_cust_info;
