# 📊 SQL Data Analysis – E-Commerce Orders

## 📌 Project Overview

This project was completed as part of the **DecodeLabs Data Analytics Project 3**. The project focuses on analyzing an e-commerce order dataset using SQL to transform raw data into meaningful business insights.

## 🛠️ Tools Used

- **MySQL**
- **MySQL Workbench**
- **SQL**
- **Microsoft Excel**
- **CSV**

## 🎯 Aim of the Project

The main objective of this project was to use SQL queries to **filter, sort, group, aggregate, and analyze e-commerce order data** in order to extract meaningful business insights.

## 📂 Dataset

- **Dataset Type:** E-Commerce / Online Orders
- **Total Records:** 1,200
- **Total Columns:** 14
- **Database:** MySQL
- **Table:** `orders`

## 🔍 What Was Performed

### 1. Data Preparation & Validation
- Imported the e-commerce dataset into MySQL.
- Verified the total number of records.
- Checked for duplicate `OrderID` values.
- Performed missing-value validation on important analytical columns.
- Identified missing/blank values in the `CouponCode` field.

### 2. SQL Querying
- Used `SELECT` to retrieve relevant data.
- Used `WHERE` to filter records based on business conditions.
- Used `ORDER BY` to sort and rank results.
- Used `GROUP BY` to create category-level summaries.

### 3. Aggregation Analysis
Used the following aggregate functions:

- `COUNT()` – Calculate order volume
- `SUM()` – Calculate total sales
- `AVG()` – Calculate average order value
- `COUNT(DISTINCT)` – Identify unique customers

### 4. Advanced SQL Analysis
- Used `HAVING` to filter grouped results.
- Used `CASE` statements for customer segmentation and categorization.
- Used subqueries for percentage contribution calculations.
- Used `YEAR()` and `DATE_FORMAT()` for time-based analysis.
- Performed multi-column grouping for deeper analysis.

### 5. Business Analysis
The dataset was analyzed across multiple business dimensions:

- **Product Performance**
- **Customer Analysis**
- **Payment Method Analysis**
- **Order Status Analysis**
- **Coupon Analysis**
- **Referral Source Analysis**
- **Year-wise Analysis**
- **Month-wise Analysis**
- **Sales Contribution Analysis**

## 📊 Key Insights

- **Total Orders:** 1,200
- **Total Sales:** ₹1,264,761.96
- **Average Order Value:** ₹1,053.97
- **Highest Total Sales:** Chair – ₹195,620.11
- **Highest Order Volume:** Printer – 181 orders
- **Highest Average Order Value:** Laptop – ₹1,110.56
- **Highest Sales Contribution:** Chair & Printer – 15.47% each
- **Lowest Sales Contribution:** Phone – 12.00%
- **Duplicate OrderIDs:** 0

## 💡 Business Insight

The analysis showed that product performance varies depending on the metric being considered. **Chair** generated the highest total sales, **Printer** recorded the highest number of orders, while **Laptop** achieved the highest average order value. This demonstrates the importance of evaluating business performance using multiple KPIs rather than relying on a single metric.

## 📁 Project Structure
