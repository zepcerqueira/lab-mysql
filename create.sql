CREATE DATABASE lab_mysql;

USE lab_mysql;

-- Create 'cars' table
CREATE TABLE cars (
    car_id INT(20) PRIMARY KEY AUTO_INCREMENT,
    VIN VARCHAR(8) UNIQUE DEFAULT 'AA-00-01',
    manufacture VARCHAR(20) UNIQUE,
    model VARCHAR(20) UNIQUE,
    year DATE UNIQUE,
    color VARCHAR(10) NULL
);

-- Create 'customers' table
CREATE TABLE customers (
    customer_id INT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    phone INT(9),
    email VARCHAR(30) NULL DEFAULT 'john_doe@gmail.com',
    address VARCHAR(50) NULL,
    city VARCHAR(30) NULL,
    state_province VARCHAR(30) NULL,
    country VARCHAR(30) NULL,
    zip_postal VARCHAR(30) NULL
);

-- Create 'sales_persons' table
CREATE TABLE sales_persons (
    staff_id INT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    store_id INT(50) UNIQUE
);

-- Create 'invoices' table
CREATE TABLE invoices (
    invoice_id INT(30) PRIMARY KEY AUTO_INCREMENT,
    date DATETIME,
    VIN VARCHAR(50) UNIQUE,
    car_id INT(50) UNIQUE,
    customer_id INT(50) UNIQUE,
    staff_id INT(50) UNIQUE,
    sale_total FLOAT(30)
);

-- Create 'total_sales' table
CREATE TABLE total_sales (
    invoice_id INT(30) PRIMARY KEY AUTO_INCREMENT,
    date DATETIME,
    sale_total FLOAT(30),
    staff_id INT(30),
    store_id INT(30),
    manufacture VARCHAR(30),
    model VARCHAR(30),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (staff_id) REFERENCES sales_persons(staff_id),
    FOREIGN KEY (store_id) REFERENCES sales_persons(store_id)
);
