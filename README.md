# Superstore_Project_2023
SQL and ML Architecture and Modelling Analysis

# Superstore Project

This repository contains an analysis of a superstore dataset to showcase my skills in SQL and Machine Learning modeling. The project aims to answer business-related questions and build regression and classification models to gain valuable insights into the store's operations, customer behavior, and product performance. # Superstore Project 2023

This project is an in-depth analysis of the limited Superstore's orders and returns data. I set out to explore various business questions using SQL and I used Python for data cleaning, data transformation, EDA, univariate, bivariate, and multivariate analysis, feature selection and feature engineering, model building (classification and prediction).


The ultimate goal of this project is to provide actionable insights that can inform decision-making and strategy for the Superstore.


## Dataset

The dataset consists of two spreadsheets containing limited information about 24,060 orders and limited information about 1210 returns from a superstore:

- **orders**: order_id, order_info_id, order_id_number, order_date, order_weekday, order_month, ship_mode, product_id, category, sub_category, product_name
- **returns**: order_id, return_date, Category, Sales, Profit, Profit Margin, Margin Category, State, Customer Name, return_quantity, reason_returned

The data is stored in an .xlsx file located in the `data` directory, as well as a .csv file called orders and a .csv file called returns.

## Project Structure

- `data`: Contains the raw data files (.xlsx) and any intermediate or processed data files (.csv).
- `sql`: Contains SQL scripts, Entity Relationship Diagrams, and any other SQL-related files.
- `jupyter_notebooks`: Contains Jupyter Notebooks for data analysis and ML modeling.
- `scripts`: Contains Python scripts for data preprocessing, feature engineering, or model evaluation.
- `documentation`: Contains the data dictionary, project report, and any other documentation files.
- `requirements.txt`: Lists the Python libraries required for the project.

## Analysis Overview

1. **SQL Analysis**: The project starts with creating SQL Entity Relationship Diagrams, Data Architecture and Modelling, and Normalization. The primary dataset was obtained in an Excel file, which I converted into CSV format using Python. The data was then imported into a MySQL database for analysis.

As part of my SQL analysis, I generated 19 business queries that helped answer critical questions about the Superstore's operations. These queries explored different aspects such as sales performance, returns, and profit margins across various categories and periods.

2. **Machine Learning Modeling**: The project proceeds with data analysis using Pandas and Jupyter Notebook, including Exploratory Data Analysis, Univariate, Bivariate, and Multivariate Analysis. We build regression models to predict continuous target variables and classification models to classify data into categories.

## Technologies

- SQL: Database design and querying
- Python: Data analysis and machine learning modeling
- Pandas: Data manipulation and analysis
- Jupyter Notebook: Interactive computing and data visualization
- Git and GitHub: Version control and project management

## Getting Started

1. Clone the repository to your local machine.
2. Install the required Python libraries listed in `requirements.txt`.
3. Explore the dataset using the Jupyter Notebooks in the `jupyter_notebooks` directory.
4. Refer to the `documentation` directory for the data dictionary and project report.

