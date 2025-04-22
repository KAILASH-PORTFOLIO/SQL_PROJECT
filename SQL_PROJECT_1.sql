drop table if exists retail_sales;
create table retail_sales
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

select * from retail_sales
order by transactions_id asc limit 50

--

select count(*) from retail_sales

-- DATA CLEANING

select *
from retail_sales
where
		transactions_id is null
		or
		sale_date is null
		or
		sale_time is null
		or
		customer_id is null
		or
		gender is null
		or
		age is null
		or
		category is null
		or
		quantity is null
		or
		price_per_unit is null
		or 
		cogs is null 
		or
		total_sale is null;

--

delete from retail_sales
where
		transactions_id is null
		or
		sale_date is null
		or
		sale_time is null
		or
		customer_id is null
		or
		gender is null
		or
		age is null
		or
		category is null
		or
		quantity is null
		or
		price_per_unit is null
		or 
		cogs is null 
		or
		total_sale is null;

-- DATA EXPLORATION
-- how many sales we have?
select count(*) as total_sales from retail_sales;

-- how many unique customers we have?
select count(distinct customer_id) as total_customer from retail_sales;

-- how many category we have?
select distinct category as total_category from retail_sales;

-- DATA ANALYSIS AND ANSWERS
-- MY ANALYSIS AND FINDINGS

--1. What is the total sales per product category?
--2. Which gender contributed more to the total sales?
--3. What is the average customer age per category?
--4. What is the average quantity sold per category?
--5. Who are the top 5 customers by total spending?
--6. What is the average profit margin per category?
--7. What is the correlation between quantity and total sale?
--8. What time of day has the highest average sales?


--1. What is the total sales per product category?
select category, sum(total_sale) as total_sales
from retail_sales
group by category
order by total_sales;

--2. Which gender contributed more to the total sales?
select gender, sum(total_sale) as total_sales
from retail_sales
group by gender
order by total_sales desc;

--3. What is the average customer age per category?
select category, avg(age) as average_customer_age
from retail_sales
group by category
order by average_customer_age

--4. What is the average quantity sold per category?
select category, avg(quantity) as avg_quantity
from retail_sales
group by category
order by avg_quantity;

--5. Who are the top 5 customers by total spending?
select * from retail_sales
select customer_id, sum(total_sale) as total_spending
from retail_sales
group by customer_id 
order by total_spending desc
limit 5;

--6. What is the average profit margin per category?
select category,
		avg(total_sale-cogs/total_sale) as profit_margin
from
		retail_sales
group by category;

--7. What is the correlation between quantity and total sale?
select
corr(quantity,total_sale) as correlation_quantity_sales
from retail_sales;

--8. What time of day has the highest average sales?
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

-- END OF PROJECT