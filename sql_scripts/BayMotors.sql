CREATE DATABASE BayMotors;

USE BayMotors;

CREATE TABLE EMPLOYEE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    mobile_number VARCHAR(15),
    role ENUM('MANAGER', 'MECHANIC') DEFAULT 'MECHANIC',
    address TEXT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE CUSTOMER (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    mobile_number VARCHAR(15) NOT NULL,
    address TEXT,
    is_registered BOOLEAN DEFAULT FALSE,
    registration_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE VEHICLE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(50),
    customer_id INT,
    last_service_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id) ON DELETE CASCADE
);

CREATE TABLE TASK (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    mechanic_id INT NOT NULL,
    description TEXT NOT NULL,
    status ENUM('PENDING', 'IN PROGRESS', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING',
    priority ENUM('Low', 'Medium', 'High') DEFAULT 'Low',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,
    rating INT CHECK (rating BETWEEN 0 AND 10),
    feedback TEXT,                                 
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLE(id) ON DELETE CASCADE,
    FOREIGN KEY (mechanic_id) REFERENCES EMPLOYEE(id) ON DELETE CASCADE
);

CREATE TABLE MANUFACTURER (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE SUPPLIER (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    manufacturer_id INT NOT NULL,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (manufacturer_id) REFERENCES MANUFACTURER(id) ON DELETE CASCADE
);


CREATE TABLE PARTS_INVENTORY (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    part_name VARCHAR(100) NOT NULL,
    part_number VARCHAR(50) UNIQUE NOT NULL,
    stock_quantity INT DEFAULT 0,
    quantity_used INT DEFAULT 0,
    price_per_unit DECIMAL(10, 2),
    vehicle_type VARCHAR(50), -- E.g., Toyota Corolla, Ford F150
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(id) ON DELETE CASCADE
);

CREATE TABLE TASK_PARTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT NOT NULL,
    part_id INT NOT NULL,
    quantity_used INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (task_id) REFERENCES TASK(id) ON DELETE CASCADE,
    FOREIGN KEY (part_id) REFERENCES PARTS_INVENTORY(id) ON DELETE CASCADE
);

CREATE TABLE NOTIFICATION (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('OFFER', 'ADVERTISEMENT') NOT NULL,
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    target_audience ENUM('REGISTERED', 'UNREGISTERED') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiry_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE CUSTOMER_NOTIFICATION (
    notification_id INT,
    customer_id INT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (notification_id, customer_id),
    FOREIGN KEY (notification_id) REFERENCES NOTIFICATION(id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)
);

INSERT INTO Employee (first_name, last_name, email, mobile_number, role, address, username, password)
VALUES ('Krishna Priya', 'Khareedhu', 'admin@baymotors.com', '9999999999', 'MANAGER', 'Cardiff, Wales, UK.', 'admin', 'admin')
;