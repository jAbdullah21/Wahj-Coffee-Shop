DROP DATABASE IF EXISTS wahj_db;
CREATE DATABASE wahj_db;
USE wahj_db;

CREATE TABLE Admin (
    admin_id INT NOT NULL AUTO_INCREMENT,
    admin_no VARCHAR(10) NOT NULL,
    admin_name VARCHAR(100) NOT NULL,
    admin_email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (admin_id),
    UNIQUE (admin_no),
    UNIQUE (admin_email)
);

CREATE TABLE Customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_no VARCHAR(10) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id),
    UNIQUE (customer_no),
    UNIQUE (customer_email)
);

CREATE TABLE Payment (
    payment_id INT NOT NULL AUTO_INCREMENT,
    payment_method VARCHAR(50) NOT NULL,
    PRIMARY KEY (payment_id)
);

CREATE TABLE Product (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    admin_id INT DEFAULT NULL,
    category VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
        ON DELETE SET NULL
);

CREATE TABLE Orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    total_amount DECIMAL(8,2) NOT NULL,
    customer_id INT NOT NULL,
    payment_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);

CREATE TABLE Order_Items (
    item_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
);

CREATE TABLE Review (
    review_id INT NOT NULL AUTO_INCREMENT,
    rating INT,
    customer_id INT,
    product_id INT,
    PRIMARY KEY (review_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE,
    CHECK (rating BETWEEN 1 AND 5)
);

INSERT INTO Admin (admin_no, admin_name, admin_email, password) VALUES
('0531023381', 'Abdullah', 'admin@wahj.com', 'admin123');

INSERT INTO Payment (payment_method) VALUES
('Cash'),
('Card'),
('Apple Pay');

INSERT INTO Customer (customer_no, customer_name, customer_email, password) VALUES
('0501111111', 'Fawaz', 'fawaz@gmail.com', '1234'),
('0532222222', 'Nasser', 'nasser@gmail.com', '1234');

INSERT INTO Product (product_name, price, admin_id, category) VALUES
('Espresso', 9.00, 1, 'Coffee'),
('Cappuccino', 14.00, 1, 'Coffee'),
('Americano', 10.00, 1, 'Coffee'),
('Flat White', 14.00, 1, 'Coffee'),
('V60', 13.00, 1, 'Coffee'),
('Iced Latte', 16.00, 1, 'Iced'),
('Iced Spanish Latte', 18.00, 1, 'Iced'),
('Iced Mocha', 17.00, 1, 'Iced'),
('Cold Brew', 15.00, 1, 'Iced'),
('Hot Chocolate', 14.00, 1, 'Hot Drinks'),
('Brownie', 12.00, 1, 'Dessert'),
('Cheesecake', 16.00, 1, 'Dessert'),
('Croissant', 10.00, 1, 'Dessert'),
('Cookie', 7.00, 1, 'Dessert'),
('Muffin', 9.00, 1, 'Dessert'),
('Chocolate Muffin', 12.00, 1, 'Dessert');

INSERT INTO Orders (total_amount, customer_id, payment_id) VALUES
(25.00, 1, 1),
(34.00, 2, 2);

INSERT INTO Order_Items (order_id, product_name, price) VALUES
(1, 'Espresso', 9.00),
(1, 'Iced Latte', 16.00),
(2, 'Iced Spanish Latte', 18.00),
(2, 'Cheesecake', 16.00);

INSERT INTO Review (rating, customer_id, product_id) VALUES
(5, 1, 1),
(4, 2, 6);