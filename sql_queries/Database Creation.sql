Create database Olist;

use olist;

CREATE TABLE olist_customers_dataset (
    customer_id VARCHAR(128) PRIMARY KEY,
    customer_unique_id VARCHAR(128),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state CHAR(2)
);

CREATE TABLE olist_geolocation_dataset (
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(255),
    geolocation_state CHAR(2)
);


CREATE TABLE olist_order_items_dataset (
    order_id VARCHAR(128),
    order_item_id INT,
    product_id VARCHAR(128),
    seller_id VARCHAR(128),
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id)
);


CREATE TABLE olist_order_payments_dataset (
    order_id VARCHAR(128),
    payment_sequential INT,
    payment_type VARCHAR(128),
    payment_installments INT,
    payment_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, payment_sequential)
);


CREATE TABLE olist_order_reviews_dataset (
    review_id VARCHAR(128) PRIMARY KEY,
    order_id VARCHAR(128),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

CREATE TABLE olist_orders_dataset (
    order_id VARCHAR(128) PRIMARY KEY,
    customer_id VARCHAR(128),
    order_status VARCHAR(50),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE olist_products_dataset (
    product_id VARCHAR(128) PRIMARY KEY,
    product_category_name VARCHAR(255),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE olist_sellers_dataset (
    seller_id VARCHAR(128) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(255),
    seller_state CHAR(2)
);


CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(255) PRIMARY KEY,
    product_category_name_english VARCHAR(255)
);


