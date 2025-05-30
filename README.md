# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `sql_project`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_project`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE sql_project;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **What is the total sales per product category?**:
```sql
select category, sum(total_sale) as total_sales
from retail_sales
group by category
order by total_sales;
```

2. **Which gender contributed more to the total sales?**:
```sql
select gender, sum(total_sale) as total_sales
from retail_sales
group by gender
order by total_sales desc;
```

3. **What is the average customer age per category?**:
```sql
select category, avg(age) as average_customer_age
from retail_sales
group by category
order by average_customer_age
```

4. **What is the average quantity sold per category?**:
```sql
select category, avg(quantity) as avg_quantity
from retail_sales
group by category
order by avg_quantity;
```

5. **Who are the top 5 customers by total spending?**:
```sql
select * from retail_sales
select customer_id, sum(total_sale) as total_spending
from retail_sales
group by customer_id 
order by total_spending desc
limit 5;
```

6. **What is the average profit margin per category?**:
```sql
select category,
		avg(total_sale-cogs/total_sale) as profit_margin
from
		retail_sales
group by category;
```

7. **What is the correlation between quantity and total sale?**:
```sql
select
corr(quantity,total_sale) as correlation_quantity_sales
from retail_sales;
```

8. **What time of day has the highest average sales?**:
```sql
SELECT 
  CASE 
    WHEN CAST(sale_time AS TIME) BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN CAST(sale_time AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
ELSE 'Evening'
END AS time_of_day,
AVG(total_sale) AS avg_sales
FROM retail_sales
GROUP BY time_of_day
ORDER BY avg_sales DESC;
```

## Findings

### 1. Total Sales by Product Category
- Categories **Electronics** generated the highest revenue.

### 2. Gender Contribution to Sales
- **Female customers** contributed slightly more to total sales than male customers.

### 3. Average Customer Age per Category
- **Beauty** products were most popular among younger customers on average.
- 🖥️ **Electronics** attracted slightly older customers compared to Beauty.
- 👕 **Clothing** had the oldest average customer age among the three categories.

### 4. Average Quantity Sold per Category
- Certain categories showed consistently **higher purchase volumes**, indicating fast-moving products.
- Useful for **inventory management** and **stock prioritization**.

### 5. Top 5 Customers by Spending
- The top 5 customers had **significantly higher total sales** than the average.
- These high-value customers are ideal for **loyalty programs** or **exclusive offers**.

### 6. Average Profit Margin per Category
- Categories like **Electronics** had **higher average profit margins**, making them prime candidates for **strategic focus**.
- Helps identify **profit-boosting** product lines.

### 7. Correlation Between Quantity and Total Sale
- A strong **positive correlation** exists between quantity sold and total sale amount.
- Confirms expected sales behavior — **more units sold = more revenue**.

### 8. Time of Day with Highest Average Sales
- The **Afternoon** time block had the **highest average sales**, followed by Morning and Evening.
- Ideal for scheduling **promotions or targeted campaigns** during peak sales hours.



> *This project is part of my portfolio as I pursue a career in data analytics. Feel free to connect and collaborate!*
