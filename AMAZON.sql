create database AMAZON;
USE AMAZON;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    address TEXT,
    created_at DATETIME
);
INSERT INTO Users (user_id, name, email,  phone_number, address, created_at) VALUES
(1, 'Arun', 'arun@gmail.com',  '9876543210', '123 Street, Chennai', '2024-08-01 10:00:00'),
(2, 'Lakshmi','lakshmi@gmail.com','9812345678', '456 Avenue, Bangalore', '2024-08-01 11:00:00'),
(3, 'Vishnu', 'vishnu@gmail.com','9876123456', '789 Boulevard, Mumbai', '2024-08-02 09:00:00'),
(4, 'Priya', 'priya@gmail.com','9876987654', '101 Parkway, Delhi', '2024-08-02 09:30:00'),
(5, 'Karthik', 'karthik@gmail.com','9812346789', '202 Elm Street, Hyderabad', '2024-08-02 10:00:00');
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category VARCHAR(50),
    created_at DATETIME
);
INSERT INTO Products (product_id, name, price, stock_quantity, category, created_at) VALUES
(1, 'Smartphone', 29999, 50, 'Electronics', '2024-08-01 12:00:00'),
(2, 'Laptop',  69999, 30, 'Electronics', '2024-08-01 12:30:00'),
(3, 'Washing Machine',  15999, 20, 'Home Appliances', '2024-08-02 10:00:00'),
(4, 'Microwave Oven', 9999, 25, 'Home Appliances', '2024-08-02 11:00:00'),
(5, 'Running Shoes', 2999, 100, 'Footwear', '2024-08-03 09:00:00');
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    delivery_address TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Orders (order_id, user_id, order_date, total_amount, status, delivery_address) VALUES
(1, 1, '2024-08-03 10:00:00', 29999, 'Shipped', '123 Street, Chennai'),
(2, 2, '2024-08-03 10:30:00', 69999, 'Processing', '456 Avenue, Bangalore'),
(3, 3, '2024-08-03 11:00:00', 45999, 'Delivered', '789 Boulevard, Mumbai'),
(4, 4, '2024-08-03 11:30:00', 9999, 'Cancelled', '101 Parkway, Delhi'),
(5, 5, '2024-08-03 12:00:00', 2999, 'Delivered', '202 Elm Street, Hyderabad');
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 29999.99),
(2, 2, 2, 1, 69999.99),
(3, 3, 1, 1, 29999.99),
(4, 3, 3, 1, 15999.99),
(5, 4, 4, 1, 9999.99),
(6, 5, 5, 1, 2999.99),
(7, 5, 5, 1, 2999.99);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Payments (payment_id, order_id, payment_date, amount, payment_method, status) VALUES
(1, 1, '2024-08-03 10:05:00', 29999.99, 'Credit Card', 'Completed'),
(2, 2, '2024-08-03 10:35:00', 69999.99, 'Net Banking', 'Pending'),
(3, 3, '2024-08-03 11:05:00', 45999.98, 'Debit Card', 'Completed'),
(4, 4, '2024-08-03 11:35:00', 9999.99, 'UPI', 'Refunded'),
(5, 5, '2024-08-03 12:05:00', 2999.99, 'Cash on Delivery', 'Completed');
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT,
    comment TEXT,
    review_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Reviews (review_id, product_id, user_id, rating, comment, review_date) VALUES
(1, 1, 1, 5, 'Excellent smartphone with great features!', '2024-08-04 10:00:00'),
(2, 2, 2, 4, 'Good laptop, but battery life could be better.', '2024-08-04 10:30:00'),
(3, 3, 3, 5, 'Very efficient washing machine.', '2024-08-04 11:00:00'),
(4, 4, 4, 3, 'Decent microwave, but heats unevenly.', '2024-08-04 11:30:00'),
(5, 5, 5, 5, 'Comfortable and stylish running shoes.', '2024-08-04 12:00:00');
