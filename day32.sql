-- Data Analysis (Sales Dataset)

--Q Find top 3 products based on total revenue
select product_id, sum(amount) as total_revenue
from sales
group by product_id
order by total_revenue DESC
limit 3;


--Q Calculate total sales for each month
select 
    month(order_date) as month,
    sum(amount) as total_sales
from sales
group by month(order_date)
order by month;


--Q Find customers whose total spending is above average

select customer_id, sum(amount) as total_spent
from sales
group by customer_id
having sum(amount) > (
    select avg(total_spent)
    from (select customer_id, sum(amount) as total_spent
          from sales
          group by customer_id) t);