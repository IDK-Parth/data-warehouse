The following datasets are synthetic CSV files generated specifically for this project.
These files were produced using prompt-engineering methods with AI-assisted data generation tools such as ChatGPT or Gemini.
They do not contain any real user information and are intended solely for development and testing purposes.

1. CRM Customer Info Table Flaws
The primary flaws in the CRM Customer Info table relate to primary key integrity (duplicates and nulls), inconsistent string formatting (unwanted spaces), and the use of abbreviations for categorical data.
Required Columns: ID (Customer ID, PK), key, first_name, last_name, marital_status, gender, create_date.
Generation Prompt:
"Generate a sample dataset for a customer information table with approximately 15 rows. The data must exhibit the following flaws:
1. Duplicate Primary Keys: At least two distinct customer IDs must appear 2 to 3 times each, using different create_date values to simulate history (e.g., ID 101 recorded on 2020-01-01 and again on 2023-11-01).
2. Null Primary Keys: Include 1 to 2 records where the ID (Customer ID) field is explicitly NULL.
3. Unwanted Spaces: Include leading or trailing spaces in the string values for both first_name (e.g., ' John ') and last_name (e.g., 'Doe ').
4. Data Standardization Needed: Use abbreviations ('F' or 'M') for the gender column, and abbreviations ('S' for Single, 'M' for Married) for the marital_status column.
5. Missing Categorical Data: Include rows where gender or marital_status fields are explicitly NULL or empty.
6. Ensure all non-ID/date columns are strings (VARCHAR) to allow for space characters."

2. CRM Product Info Table Flaws
This table includes issues with missing numerical data (costs), standardization of product lines, and, critically, illogical historical date sequencing and overlap.
Required Columns: PRD_ID (PK), product_key, product_name, costs, product_line, start_date, end_date.
Generation Prompt:
"Generate a sample dataset for a product information table (with historical cost tracking) with approximately 10 rows. The data must exhibit the following flaws:
1. Missing Costs: Include at least two records where the costs field is NULL.
2. Product Line Abbreviations: Use abbreviated codes for product_line (e.g., 'M', 'R', 'S', 'T') instead of full names (Mountain, Rods, Sales, Touring).
3. Invalid Date Order: For one historical record associated with a product_key, set the end_date to be chronologically smaller than the start_date (e.g., Start: 2020-01-01, End: 2019-12-31).
4. Overlapping History: For a specific product_key that has multiple historical entries, ensure that the time intervals overlap (e.g., Record A: 2010-01-01 to 2015-01-01, Record B: 2014-01-01 to 2018-01-01).
5. Missing Start Date: Include one record where the start_date field is NULL.
6. Date Type Issue: Ensure both start_date and end_date are stored as datetime data types and include unnecessary time components (e.g., 2023-10-25 00:00:00.000)

3. CRM Sales Details Table Flaws
This table is transactional and suffers from severe data type issues (dates as integers), invalid numerical metrics (nulls, negatives, zeros), and violations of core business rules (incorrect calculations).
Required Columns: order_number, SLS_product_key, CST_ID, order_date, shipping_date, due_date, sales, quantity, price.
Generation Prompt:
"Generate a sample dataset for a sales details table with approximately 15 rows. The data must exhibit the following flaws:
1. Integer Dates: All three date columns (order_date, shipping_date, due_date) must be stored as integers, representing dates in YYYYMMDD format.
2. Invalid Date Values:
    ◦ Include records where the integer date columns contain a zero (0).
    ◦ Include records where the integer date columns contain numerical values that are not 8 characters long (e.g., '2023' or '20231').
3. Missing or Invalid Financials:
    ◦ Include records where sales or price fields are NULL or empty.
    ◦ Include records where sales or price fields contain negative numbers (e.g., -50.00).
    ◦ Include records where the sales field is zero (0). (Note: quantity must remain positive integer).
4. Incorrect Calculations (Business Rule Violation): Include records where the sales amount is mathematically incorrect (Sales 

= Quantity × Price), for example, where Quantity=1, Price=50, but Sales=2

4. ERP Customer AZ 12 Table Flaws
This table contains customer demographic data with issues related to inconsistent IDs, impossible future birth dates, and non-standardized categorical values.
Required Columns: C_ID, birth_date, gender.
Generation Prompt:
"Generate a sample dataset for a customer demographic table with approximately 10 rows. The data must exhibit the following flaws:
1. Invalid ID Characters: Include records where the C_ID (Customer ID) contains the extraneous prefix 'NAS' (e.g., 'NAS12345').
2. Future Birth Dates: Include records where the birth_date is chronologically set higher than the current date (e.g., 2050-05-15).
3. Inconsistent Gender Data: Use a variety of inconsistent representations for gender, including:
    ◦ NULL values.
    ◦ Empty strings or strings containing only spaces.
    ◦ Mixed case abbreviations ('f', 'M').
    ◦ Full words ('male', 'Female')

5. ERP Location Table Flaws
Flaws here focus on internal ID inconsistency preventing joins, and poor standardization of geographic names, including missing values.
Required Columns: CI_ID, country.
Generation Prompt
"Generate a sample dataset for a customer location table with approximately 10 rows. The data must exhibit the following flaws:
1. Invalid ID Separator: Include records where the CI_ID contains unnecessary minus separators (hyphens) between characters and numbers (e.g., 'C12-345').
2. Missing Country Values: Include records where the country field is NULL or an empty string ("").
3. Inconsistent Country Standardization: Include a mix of full country names and abbreviations, including 'D', 'US', 'USA', and 'Germany'.
4. Unwanted Spaces in Country Names: Include leading or trailing spaces within some country name string values (e.g., ' United Kingdom ')

6. ERP PX Catalog Table Flaws
The ERP PX Catalog table was specifically noted in the analysis as having "really nice data quality" and did not require data cleansing or standardization transformations. Therefore, the prompt should generate a clean dataset that reflects this finding.
Required Columns: ID, category, subcategory, maintenance.
Generation Prompt:
"Generate a small sample dataset for a product category catalog (approximately 8 rows). The data must reflect the high quality observed in the sources:
1. No Flaws: The data must be clean, requiring no transformations.
2. No Unwanted Spaces: Ensure all string values in category, subcategory, and maintenance have no leading or trailing spaces.
3. Standardized Values: Ensure categorical values are already friendly and nice, using full names (e.g., 'Accessories', 'Bikes', 'Clothing', 'Components').
4. No Missing Values: Do not include any NULL or empty string values in any column