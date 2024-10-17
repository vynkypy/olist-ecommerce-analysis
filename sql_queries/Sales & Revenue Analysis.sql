
-- 1. Total Revenue Over Time (Monthly)

SELECT 
    YEAR(order_purchase_timestamp) AS year,
    MONTH(order_purchase_timestamp) AS month,
    SUM(price + freight_value) AS total_revenue
FROM
    olist_order_items_dataset oi
        JOIN
    olist_orders_dataset o ON oi.order_id = o.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY year , month
ORDER BY year , month;


-- 2. Top Product Categories by Revenue

SELECT 
    p.product_category_name, SUM(oi.price) AS total_revenue
FROM
    olist_order_items_dataset oi
        JOIN
    olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;



