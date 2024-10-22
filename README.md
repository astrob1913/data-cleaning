# Data Cleaning Project Using MySQL 

This project focuses on cleaning a raw dataset with over 1000+ records using MySQL queries for analysis. The data cleaning process involves four key procedures: removing duplicates, standardizing data, handling null values, and dropping irrelevant columns, that are essential for ensuring high-quality datasets.

## Project Overview

Data cleaning is essential to ensure that the dataset is accurate, complete, and ready for analysis. This project uses MySQL language to perform various cleaning operations on the dataset in MS Excel. The four main procedures are described below.

### 1. Removing Duplicates

- ROW_NUMBER(): We use ROW_NUMBER() OVER (PARTITION BY...) to create a column (row_num) that helps identify duplicate records. This allows us to pinpoint and remove duplicates easily.
- Common Table Expressions (CTE): We utilized CTEs to simplify the query, making it more readable and efficient when filtering duplicates.

### 2.  Standardizing the Data

- TRIM(): Used to remove unwanted spaces.
- TRAILING(): Applied to remove unnecessary symbols.
- Data Type Conversion: Modified text types to date types, ensuring consistency in date-related fields.

### 3. Removing Null or Blank Values

- JOIN Clause: Applied JOIN operations to fill in missing or blank values by pulling data from related tables.

### 4. Removing Irrelevant Columns

-DROP Statement: Used to eliminate unnecessary columns that do not contribute to the analysis.

### Technologies Used

-MySQL Workbench: For executing SQL queries.
-MS Excel: The dataset was imported/exported to and from Excel for data analysis.
