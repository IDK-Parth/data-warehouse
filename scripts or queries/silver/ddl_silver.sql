USE silver;

-- 1. CRM Customer Info
DROP TABLE IF EXISTS crm_cust_info;

CREATE TABLE crm_cust_info (
    cst_id             INT,
    cst_key            VARCHAR(50),
    cst_firstname      VARCHAR(50),
    cst_lastname       VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr           VARCHAR(50),
    cst_create_date    DATE,
    dwh_create_date    DATETIME DEFAULT NOW() -- Replaces GETDATE()
);

-- 2. CRM Product Info
DROP TABLE IF EXISTS crm_prd_info;

CREATE TABLE crm_prd_info (
    prd_id          INT,
    cat_id          VARCHAR(50), -- Derived column (will be created in transformation)
    prd_key         VARCHAR(50),
    prd_nm          VARCHAR(50),
    prd_cost        INT,
    prd_line        VARCHAR(50),
    prd_start_dt    DATE,
    prd_end_dt      DATE,
    dwh_create_date DATETIME DEFAULT NOW()
);

-- 3. CRM Sales Details
DROP TABLE IF EXISTS crm_sales_details;

CREATE TABLE crm_sales_details (
    sls_ord_num     VARCHAR(50),
    sls_prd_key     VARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    DATE, -- Fixed data type (was INT in Bronze)
    sls_ship_dt     DATE, -- Fixed data type (was INT in Bronze)
    sls_due_dt      DATE, -- Fixed data type (was INT in Bronze)
    sls_sales       INT,
    sls_quantity    INT,
    sls_price       INT,
    dwh_create_date DATETIME DEFAULT NOW()
);

-- 4. ERP Location Table
DROP TABLE IF EXISTS erp_loc_a101;

CREATE TABLE erp_loc_a101 (
    cid             VARCHAR(50),
    cntry           VARCHAR(50),
    dwh_create_date DATETIME DEFAULT NOW()
);

-- 5. ERP Customer Table
DROP TABLE IF EXISTS erp_cust_az12;

CREATE TABLE erp_cust_az12 (
    cid             VARCHAR(50),
    bdate           DATE,
    gen             VARCHAR(50),
    dwh_create_date DATETIME DEFAULT NOW()
);

-- 6. ERP Product Category Table
DROP TABLE IF EXISTS erp_px_cat_g1v2;

CREATE TABLE erp_px_cat_g1v2 (
    id              VARCHAR(50),
    cat             VARCHAR(50),
    subcat          VARCHAR(50),
    maintenance     VARCHAR(50),
    dwh_create_date DATETIME DEFAULT NOW()
);


CALL bronze.load_bronze();