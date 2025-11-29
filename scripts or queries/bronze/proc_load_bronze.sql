use bronze;
DELIMITER //

DROP PROCEDURE IF EXISTS load_bronze //

CREATE PROCEDURE load_bronze()
BEGIN
    -- 1. Variable Declaration
    DECLARE start_time DATETIME;
    DECLARE end_time DATETIME;
    DECLARE batch_start_time DATETIME;
    DECLARE batch_end_time DATETIME;
    
    -- 2. Error Handling (Replaces TRY...CATCH)
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
        @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
        SELECT CONCAT('ERROR OCCURRED: ', @p1, ': ', @p2) AS Error_Message;
    END;

    -- 3. Execution Logic
    SET batch_start_time = NOW();
    SELECT '================================================' AS Log;
    SELECT 'Loading Bronze Layer' AS Log;
    SELECT '================================================' AS Log;

    -- ------------------------------------------------
    -- Loading CRM Tables
    -- ------------------------------------------------
    SELECT '------------------------------------------------' AS Log;
    SELECT 'Loading CRM Tables' AS Log;
    SELECT '------------------------------------------------' AS Log;

    -- >> Table 1: crm_cust_info
    SET start_time = NOW();
    SELECT '>> Truncating and Loading: bronze.crm_cust_info' AS Status;
    TRUNCATE TABLE bronze.crm_cust_info;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_info.csv' -- UPDATE PATH
    INTO TABLE bronze.crm_cust_info
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Duration;

    -- >> Table 2: crm_prd_info (INCLUDES THE FIX FOR EMPTY VALUES)
    SET start_time = NOW();
    SELECT '>> Truncating and Loading: bronze.crm_prd_info' AS Status;
    TRUNCATE TABLE bronze.crm_prd_info;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prd_info.csv' -- UPDATE PATH
    INTO TABLE bronze.crm_prd_info
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (prd_id, prd_key, prd_nm, @v_cost, prd_line, @v_start_dt, @v_end_dt) -- Variables for safe loading
    SET 
        prd_cost     = NULLIF(@v_cost, ''),
        prd_start_dt = NULLIF(@v_start_dt, ''),
        prd_end_dt   = NULLIF(@v_end_dt, '');
    
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Duration;

    -- >> Table 3: crm_sales_details
    SET start_time = NOW();
    SELECT '>> Truncating and Loading: bronze.crm_sales_details' AS Status;
    TRUNCATE TABLE bronze.crm_sales_details;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_details.csv' -- UPDATE PATH
    INTO TABLE bronze.crm_sales_details
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Duration;

    -- ------------------------------------------------
    -- Loading ERP Tables
    -- ------------------------------------------------
    SELECT '------------------------------------------------' AS Log;
    SELECT 'Loading ERP Tables' AS Log;
    SELECT '------------------------------------------------' AS Log;

    -- >> Table 4: erp_loc_a101
    SET start_time = NOW();
    SELECT '>> Truncating and Loading: bronze.erp_loc_a101' AS Status;
    TRUNCATE TABLE bronze.erp_loc_a101;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/loc_a101.csv' -- UPDATE PATH
    INTO TABLE bronze.erp_loc_a101
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Duration;

    -- >> Table 5: erp_cust_az12
    SET start_time = NOW();
    SELECT '>> Truncating and Loading: bronze.erp_cust_az12' AS Status;
    TRUNCATE TABLE bronze.erp_cust_az12;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_az12.csv' -- UPDATE PATH
    INTO TABLE bronze.erp_cust_az12
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Duration;

    -- >> Table 6: erp_px_cat_g1v2
    SET start_time = NOW();
    SELECT '>> Truncating and Loading: bronze.erp_px_cat_g1v2' AS Status;
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/px_cat_g1v2.csv' -- UPDATE PATH
    INTO TABLE bronze.erp_px_cat_g1v2
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Duration;

    -- Final Summary
    SET batch_end_time = NOW();
    SELECT '==========================================' AS Log;
    SELECT CONCAT('Loading Bronze Layer Completed. Total Duration: ', TIMESTAMPDIFF(SECOND, batch_start_time, batch_end_time), ' seconds') AS Summary;
    SELECT '==========================================' AS Log;

END //

DELIMITER ;
DELIMITER ;
DELIMITER ;