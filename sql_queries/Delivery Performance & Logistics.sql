-- 1.Average Delivery Time by State
SELECT 
    c.customer_state,
    AVG(TIMESTAMPDIFF(DAY,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date)) AS avg_delivery_time_days
FROM
    olist_customers_dataset c
        JOIN
    olist_orders_dataset o ON c.customer_id = o.customer_id
WHERE
    o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_delivery_time_days;


-- 2. Percentage of Late Deliveries
SELECT 
    COUNT(*) * 100.0 / (SELECT 
            COUNT(*)
        FROM
            olist_orders_dataset
        WHERE
            order_status = 'delivered') AS late_percentage
FROM
    olist_orders_dataset
WHERE
    order_delivered_customer_date > order_estimated_delivery_date;
