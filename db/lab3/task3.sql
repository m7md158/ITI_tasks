-- select count(customer_id)  from customers;


-- select avg(price) from products;


-- select max(quantity) from order_details;


-- select category_id, sum(price) from products
-- group by category_id;



-- select min(price) from products
-- where category_id = 1;



-- select country, count(customer_id) from customers
-- group by country;



-- select customer_id, count(customer_id) as order_count from orders
-- group by customer_id;

--------------------------------------------------------------------------------------------------

-- select orders.order_id, customers.customer_name, orders.order_date  from orders 
-- inner join customers  on orders.customer_id = customers.customer_id;




-- select products.product_name, order_details.quantity from order_details 
-- inner join products  on order_details.product_id = products.product_id;




-- select distinct customers.customer_id, customers.customer_name from customers 
-- inner join orders  on customers.customer_id = orders.customer_id;



-- select products.product_name, categories.category_name from products 
-- left join categories on products.category_id = categories.category_id;



-- select customers.customer_name, orders.order_date from customers 
-- left join orders on customers.customer_id = orders.customer_id;




-- select orders.order_id, products.product_name, customers.customer_name, orders.order_date, order_details.quantity 
-- from orders 
-- inner join order_details  on orders.order_id = order_details.order_id
-- inner join products  on order_details.product_id = products.product_id
-- inner join customers  on orders.customer_id = customers.customer_id
-- where orders.order_date between '2024-01-01' and '2024-12-31';



-- select customers.customer_name, sum(order_details.quantity) as total_products_ordered from customers 
-- inner join orders on customers.customer_id = orders.customer_id
-- inner join order_details  on orders.order_id = order_details.order_id
-- group by customers.customer_name;

------------------------------------------------------------------------------------------------------------

-- select product_name, price,
-- 	case
-- 	    when price < 50 then 'cheap'
-- 	    when price between 50 and 100 then 'moderate'
-- 	    when price > 100 then 'expensive'
--   	end as price_level
-- from products;



-- select customer_name, country,
--  	 case
-- 	    when lower(country) = 'egypt' then 'egyptian'
--     else 'foreign'
--   	end as location_type
-- from customers;



-- select order_id, product_id, quantity,
-- 	case
-- 	    when quantity < 5 then 'low'
-- 	    when quantity between 5 and 10 then 'medium'
-- 	    when quantity > 10 then 'high'
--   	end as quantity_status
-- from order_details;



-- select product_name, price,
--   	case
-- 	    when price > 150 then '10%'
-- 	    when price between 100 and 150 then '5%'
--     else '0%'
--   	end as discount
-- from products;

---------------------------------------------

-- select product_name , price from products 
-- order by price desc
-- limit 3;



-- select  category_id
-- from products
-- where category_id not in (1, 2, 3);


------------------------------------------------------

-- select product_name
-- from products
-- where product_name like 'C%e';



-- select product_name
-- from products
-- where product_name like '%ch%';


-- select customer_name
-- from customers
-- where customer_name like '___';


-- select product_name from products
-- where product_name like '%a%e%';


-- select * from products;


-- select product_name from products
-- where product_name ~ '[aeiou]';



select product_name
from products
where product_name ~ '[a-z]';