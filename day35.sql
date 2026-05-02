-- SQL Data Analysis (Business Insights)

--Q Total sales and number of orders per day
select 
    order_date,
    count(order_id) as total_orders,
    sum(amount) as total_sales
from orders
group by order_date
order by order_date;


--Q Find top spending customer for each day
select *
from (select 
        order_date,
        customer_id,
        sum(amount) as total_spent,
        row_number() over (partition by order_date order by sum(amount) DESC) as rn
    from orders
    group by order_date, customer_id) t
where rn = 1;


--Q Calculate percentage contribution of each product in total sales
select 
    product_id,
    sum(amount) as product_sales,
    (sum(amount) / (select sum(amount) from orders)) * 100 as percentage_contribution
from orders
group by product_id;

