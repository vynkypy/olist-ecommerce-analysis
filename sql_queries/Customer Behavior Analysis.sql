-- 1. Customer Retention: Number of Returning Customers

SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS order_count
FROM
    olist_customers_dataset c
        JOIN
    olist_orders_dataset o ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT o.order_id) > 1;


-- 2. Active Cities with the Most Orders

SELECT 
    c.customer_city, COUNT(o.order_id) AS total_orders
FROM
    olist_customers_dataset c
        JOIN
    olist_orders_dataset o ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC
LIMIT 10;
