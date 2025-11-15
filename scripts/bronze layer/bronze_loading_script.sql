/* Purpose:
This script load data from csv files into the respective table, created in DDL script for bronze layer

The file location may be different for each user, please adjust accordingly
*/

-- CRM Customer Info
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\training\sql datawarehouse\datasets\source_crm\cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-------------------------------------------------------------

-- CRM Product Info
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'C:\training\sql datawarehouse\datasets\source_crm\prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-------------------------------------------------------------

-- CRM Sales Detail
TRUNCATE TABLE bronze.crm_sales_detail;

BULK INSERT bronze.crm_sales_detail
FROM 'C:\training\sql datawarehouse\datasets\source_crm\sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-------------------------------------------------------------

-- ERP Customer AZ12
TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM 'C:\training\sql datawarehouse\datasets\source_erp\CUST_AZ12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-------------------------------------------------------------

-- ERP Location A101
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'C:\training\sql datawarehouse\datasets\source_erp\loc_a101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-------------------------------------------------------------

-- ERP Product Category G1V2
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\training\sql datawarehouse\datasets\source_erp\px_cat_g1v2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);


