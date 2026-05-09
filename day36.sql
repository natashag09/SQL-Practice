-- SQL Data Analysis (Sales and Customers)

--Q Find the customer with highest total spending

select
    customer_id,
    sum(amount) as total_spent
from orders
group by customer_id
order by total_spent DESC
limit 1;


--Q Calculate average order amount for each customer

select
    customer_id,
    avg(amount) as avg_order_amount
from orders
group by customer_id;


--Q Find products that were never ordered

select
    p.product_id,
    p.product_name
from products p
left join orders o
on p.product_id = o.product_id
where o.product_id is null;