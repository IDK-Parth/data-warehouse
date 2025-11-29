USE bronze;

-- 1. CRM Customer Info
DROP TABLE IF EXISTS crm_cust_info;

# for now the date is shored in varchar since it is a injestion layer and later it will openerate on it
CREATE TABLE crm_cust_info (
    cst_id              INT,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(50),
    cst_lastname        VARCHAR(50),
    cst_marital_status  VARCHAR(50),
    cst_gndr            VARCHAR(50),
    cst_create_date     DATE
);

-- 2. CRM Product Info
DROP TABLE IF EXISTS crm_prd_info;

CREATE TABLE crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

-- 3. CRM Sales Details
DROP TABLE IF EXISTS crm_sales_details;

CREATE TABLE crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

-- 4. ERP Location Table
DROP TABLE IF EXISTS erp_loc_a101;

CREATE TABLE erp_loc_a101 (
    cid    VARCHAR(50),
    cntry  VARCHAR(50)
);

-- 5. ERP Customer Table
DROP TABLE IF EXISTS erp_cust_az12;

CREATE TABLE erp_cust_az12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50)
);

-- 6. ERP Product Category Table
DROP TABLE IF EXISTS erp_px_cat_g1v2;

CREATE TABLE erp_px_cat_g1v2 (
    id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50)
);

select * from bronze.crm_cust_info;
select * from bronze.crm_prd_info;
select * from bronze.crm_sales_details;
select * from bronze.erp_cust_az12;
select * from bronze.erp_loc_a101;
select * from bronze.erp_px_cat_g1v2;

select count(*) from bronze.crm_cust_info;
select count(*) from bronze.crm_prd_info;
select count(*) from bronze.crm_sales_details;
select count(*) from bronze.erp_cust_az12;
select count(*) from bronze.erp_loc_a101;
select count(*) from bronze.erp_px_cat_g1v2;