CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE customer (
    customer_id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(65) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_no VARCHAR(15) NOT NULL,
    address VARCHAR(100) NOT NULL,
    pin_code INT NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE product (
    product_id VARCHAR(10) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(65) NOT NULL,
    sub_category VARCHAR(45) NOT NULL,
    original_price DOUBLE NOT NULL,
    selling_price DOUBLE NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE order_details (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity DOUBLE NOT NULL,
    total_price DOUBLE NOT NULL,
    payment_mode VARCHAR(60) NOT NULL,
    order_date DATETIME DEFAULT NULL,
    order_status VARCHAR(20) NOT NULL,
    PRIMARY KEY (order_id),
    KEY customer_id (customer_id),
    KEY product_id (product_id),
    CONSTRAINT order_details_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT order_details_ibfk_2 FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- Populate tables with sample data
-- Insert customer data
INSERT INTO customer (customer_id, name, city, email, phone_no, address, pin_code) VALUES
('C001', 'John Doe', 'New York', 'johndoe@example.com', '1234567890', '123 6th Ave', 10001),
('C002', 'Jane Smith', 'Los Angeles', 'janesmith@example.com', '0987654321', '456 7th Ave', 90001);

-- Insert product data
INSERT INTO product (product_id, product_name, category, sub_category, original_price, selling_price, stock) VALUES
('P001', 'Product 1', 'Electronics', 'Mobile', 300, 250, 50),
('P002', 'Product 2', 'Apparel', 'T-Shirt', 20, 15, 200);

-- Insert order details
INSERT INTO order_details (customer_id, product_id, quantity, total_price, payment_mode, order_date, order_status) VALUES
('C001', 'P001', 2, 500, 'Credit Card', '2024-08-20 12:34:56', 'Delivered'),
('C002', 'P002', 3, 45, 'PayPal', '2024-08-21 14:22:33', 'Pending');
