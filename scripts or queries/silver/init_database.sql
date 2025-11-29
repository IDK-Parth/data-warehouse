-- 1. Initialize Bronze Layer
DROP DATABASE IF EXISTS bronze;
CREATE DATABASE bronze 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

-- 2. Initialize Silver Layer

DROP DATABASE IF EXISTS silver;
CREATE DATABASE silver 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

-- 3. Initialize Gold Layer

DROP DATABASE IF EXISTS gold;
CREATE DATABASE gold 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

-- 4. Initialize Main DataWarehouse Container (Optional)
--    Useful if you want a central place for project-level stored procedures

DROP DATABASE IF EXISTS DataWarehouse;
CREATE DATABASE DataWarehouse 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;