/* Purpose: 
This script creates the required database tables in the bronze layer for storing source ERP and CRM data.
It first checks whether each table already exists and drops it if necessary, ensuring a clean recreation of all structures.
The script defines the table schemas (DDL), including column names, data types, and basic layout, so that incoming CSV files can be consistently loaded into a standardized format
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.crm_cust_info;
END;
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id             INT            NOT NULL,
    cst_key            INT            NULL,
    cst_firstname      NVARCHAR(50)   NULL,
    cst_lastname       NVARCHAR(50)   NULL,
    cst_marital_status NVARCHAR(50)   NULL,
    cst_gndr           NVARCHAR(50)   NULL,
    cst_create_date    DATE       NULL
);
GO
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.crm_prd_info;
END;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id        INT            NOT NULL,
    prd_key       NVARCHAR(50)   NULL,
    prd_nm        NVARCHAR(50)   NULL,
    prd_cost      INT            NULL,
    prd_line      NVARCHAR(50)   NULL,
    prd_start_dt  DATE       NULL,
    prd_end_dt    DATE       NULL
);
GO


IF OBJECT_ID('bronze.crm_sales_detail', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.crm_sales_detail;
END;
GO

CREATE TABLE bronze.crm_sales_detail (
    sls_ord_num   NVARCHAR(50)   NOT NULL,
    sls_prd_key   NVARCHAR(50)   NULL,
    sls_cust_id   INT            NULL,
    sls_order_dt  NVARCHAR(50)       NULL,
    sls_ship_dt   NVARCHAR(50)       NULL,
    sls_due_dt    NVARCHAR(50)       NULL,
    sls_sales     INT            NULL,
    sls_quantity  INT            NULL,
    sls_price     INT            NULL
);
GO
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.erp_loc_a101;
END;
GO

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.erp_cust_az12;
END;
GO
CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);


GO
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.erp_px_cat_g1v2;
END;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);
