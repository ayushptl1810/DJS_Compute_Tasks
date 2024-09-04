-- BASIC QUERIES

-- 1. We retrieve the product name and order them by quantity
select p.product_name, count(o.quantity)
from Orders o 
join Product p on o.product_id = p.product_id
group by p.product_name;


-- 2. We use the date_sub function along with curdate to get the current date and interval to only fetch the last 7 days
select p.product_name, o.order_id, o.quantity, o.order_date
from Product p
join Orders o on p.product_id = o.product_id
where o.order_date >= date_sub(curdate(), interval 7 day);

-- 3. We find the sales amount per order here by grouping total sales amount by order id
select o.order_id, sum(o.quantity * p.price) AS total_sales_amount
from Orders o
join Product p on o.product_id = p.product_id
group by o.order_id;


-- INTERMEDIATE QUERIES

-- 1. We use desc along with limit 3 function to find the top 3 best selling products 
select p.product_name, sum(o.quantity) as quantity
from Orders o 
join Product p on o.product_id = p.product_id
group by p.product_name
order by quantity desc
limit 3;

-- 2. We find the revenue generated per product
select p.product_id, p.product_name, sum(o.quantity * p.price) AS total_revenue
from Orders o
join Product p on o.product_id = p.product_id
group by p.product_id, p.product_name;


-- 3. We left join so that we can get null values if present and then check for null product id values to find products that havent been ordered
select p.product_id, p.product_name
from Product p
left join Orders o on o.product_id = p.product_id
where o.product_id is null;


-- DATETIME QUERIES

-- 1. We used Case here because we know that only 12 different values are present for month
select case month(order_date)
		when 1 then 'January'
        when 2 then 'February'
        when 3 then 'March'
        when 4 then 'April'
        when 5 then 'May'
        when 6 then 'June'
        when 7 then 'July'
        when 8 then 'August'
        when 9 then 'September'
        when 10 then 'October'
        when 11 then 'November'
        when 12 then 'December'
    END AS month, count(order_id) as order_count
from Orders
where year(order_date) = 2023
group by month;

-- 2. We used dayofweek function to get the day of order in numerical format and (1,7) for Sunday and Saturday respectively
select *
from orders
where dayofweek(order_date) in (1,7);


-- CUSTOMER FOCUSED QUERIES

-- 1. We use count function to get number of customers
select customer_id, count(*)
from Orders
group by customer_id
having count(*) > 5;

-- 2. Month function here fetches the numerical value for order date 
select distinct customer_id, order_date
from Orders 
where month(order_date) = 1;

-- 3.
-- a. We can split the order_date column into days, months and years so that we can write easier queries. Even making an index on this column will help a lot.
-- b. Since we are using customer_id and order_id in almost every query, we can create an index on each table to lower the time taken to process the query. 
-- We can also create an index on order_date column since we have used it multiple times aswell.
