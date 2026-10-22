-- Create and select the database
CREATE DATABASE IF NOT EXISTS online_shop_db;
USE online_shop_db;

-- 1. Create Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Products Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 3. Create Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Insert Sample Data into Customers
INSERT INTO customers (first_name, last_name, email) VALUES
('Gamar', 'Joseph', 'gamar@example.com'),
('Daniel', 'Smith', 'daniel@example.com');

-- Insert Sample Data into Products
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Wireless Laptop Mouse', 25.50, 40),
('Mechanical Gaming Keyboard', 89.99, 15),
('USB-C Fast Charger', 15.00, 100);

-- Insert Sample Data into Orders
INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 2, 1),
(2, 1, 2);
