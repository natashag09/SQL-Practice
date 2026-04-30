-- SQL Data Analysis (Advanced)

--Q Find total amount spent by each customer
select 
      c.customer_id,  
      c.customer_name, 
      sum(o.amount) as total_spent
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;


--Q Find product with highest total sales
select
       p.product_id, 
       p.product_name, 
       sum(o.amount) as total_sales
from products p
join orders o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by total_sales DESC
limit 1;


--Q Find customers who never placed an order
SELECT 
      c.customer_id, 
      c.customer_name
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;