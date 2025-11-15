/* Purpose:
This script define a procedure that load data from csv files into the respective table, created in DDL script for bronze layer
Once the procedure is defined, the procedure can be run as frequently as desired to update infomation from csv file.
The file location may be different for each user, please adjust accordingly

*/

CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS
BEGIN

    DECLARE 
        @start_time DATETIME2(7),
        @end_time DATETIME2(7),
        @duration_ms INT,
        @total_start DATETIME2(7),
        @total_end DATETIME2(7),
        @total_ms INT;

    SET @total_start = SYSDATETIME();

    PRINT '===== STARTING BRONZE LAYER LOAD =====';


    -------------------------------------------------------------
    -- ===============   LOAD INFORMATION FROM CRM   ===============
    -------------------------------------------------------------


    -------------------------------------------------------------
    -- CRM Customer Info
    -------------------------------------------------------------
    PRINT 'Updating information for CRM Customer Info...';
    SET @start_time = SYSDATETIME();

    TRUNCATE TABLE bronze.crm_cust_info;

    BULK INSERT bronze.crm_cust_info
    FROM 'C:\training\sql datawarehouse\datasets\source_crm\cust_info.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

    SET @end_time = SYSDATETIME();
    SET @duration_ms = DATEDIFF(MILLISECOND, @start_time, @end_time);
    PRINT 'CRM Customer Info load completed in ' + CAST(@duration_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@duration_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';



    -------------------------------------------------------------
    -- CRM Product Info
    -------------------------------------------------------------
    PRINT 'Updating information for CRM Product Info...';
    SET @start_time = SYSDATETIME();

    TRUNCATE TABLE bronze.crm_prd_info;

    BULK INSERT bronze.crm_prd_info
    FROM 'C:\training\sql datawarehouse\datasets\source_crm\prd_info.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

    SET @end_time = SYSDATETIME();
    SET @duration_ms = DATEDIFF(MILLISECOND, @start_time, @end_time);
    PRINT 'CRM Product Info load completed in ' + CAST(@duration_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@duration_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';



    -------------------------------------------------------------
    -- CRM Sales Detail
    -------------------------------------------------------------
    PRINT 'Updating information for CRM Sales Detail...';
    SET @start_time = SYSDATETIME();

    TRUNCATE TABLE bronze.crm_sales_detail;

    BULK INSERT bronze.crm_sales_detail
    FROM 'C:\training\sql datawarehouse\datasets\source_crm\sales_details.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

    SET @end_time = SYSDATETIME();
    SET @duration_ms = DATEDIFF(MILLISECOND, @start_time, @end_time);
    PRINT 'CRM Sales Detail load completed in ' + CAST(@duration_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@duration_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';



    -------------------------------------------------------------
    -- ===============   LOAD INFORMATION FROM ERP   ===============
    -------------------------------------------------------------


    -------------------------------------------------------------
    -- ERP Customer AZ12
    -------------------------------------------------------------
    PRINT 'Updating information for ERP Customer AZ12...';
    SET @start_time = SYSDATETIME();

    TRUNCATE TABLE bronze.erp_cust_az12;

    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\training\sql datawarehouse\datasets\source_erp\CUST_AZ12.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

    SET @end_time = SYSDATETIME();
    SET @duration_ms = DATEDIFF(MILLISECOND, @start_time, @end_time);
    PRINT 'ERP Customer AZ12 load completed in ' + CAST(@duration_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@duration_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';



    -------------------------------------------------------------
    -- ERP Location A101
    -------------------------------------------------------------
    PRINT 'Updating information for ERP Location A101...';
    SET @start_time = SYSDATETIME();

    TRUNCATE TABLE bronze.erp_loc_a101;

    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\training\sql datawarehouse\datasets\source_erp\loc_a101.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

    SET @end_time = SYSDATETIME();
    SET @duration_ms = DATEDIFF(MILLISECOND, @start_time, @end_time);
    PRINT 'ERP Location A101 load completed in ' + CAST(@duration_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@duration_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';



    -------------------------------------------------------------
    -- ERP Product Category G1V2
    -------------------------------------------------------------
    PRINT 'Updating information for ERP Product Category G1V2...';
    SET @start_time = SYSDATETIME();

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\training\sql datawarehouse\datasets\source_erp\px_cat_g1v2.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

    SET @end_time = SYSDATETIME();
    SET @duration_ms = DATEDIFF(MILLISECOND, @start_time, @end_time);
    PRINT 'ERP Product Category G1V2 load completed in ' + CAST(@duration_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@duration_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';



    -------------------------------------------------------------
    -- Summary
    -------------------------------------------------------------
    SET @total_end = SYSDATETIME();
    SET @total_ms = DATEDIFF(MILLISECOND, @total_start, @total_end);

    PRINT '=============================================================';
    PRINT 'Bronze layer load completed successfully.';
    PRINT 'Total time for all tables: ' + CAST(@total_ms AS VARCHAR(20)) 
          + ' ms (' + CAST(@total_ms / 1000.0 AS VARCHAR(20)) + ' seconds).';
    PRINT '=============================================================';

END;
GO


