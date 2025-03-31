-- Database: support_system
CREATE DATABASE IF NOT EXISTS support_system;
USE support_system;

-- Tables
CREATE TABLE Roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    role_name ENUM('Guest', 'Client', 'Agent', 'Agent_Supervisor', 'Admin'),
    role_description TEXT,
    created_at DATETIME NOT NULL, 
    modified_at DATETIME NOT NULL
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    role_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Agents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    user_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    supervisor_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    max_tickets INT DEFAULT 7,
    current_tickets INT DEFAULT 0,
    hiring_date DATETIME NOT NULL, 
    contract_type ENUM(),
    FOREIGN KEY (supervisor_id) REFERENCES Agents(agent_id)
    FOREIGN KEY (user_id) REFERENCES Users(user_id)--to be modified
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    product_name VARCHAR(50) NOT NULL,
    product_description TEXT,
    category_product ENUM('PC', 'Smartphone', 'Accessories', 'Appliances')
    weight_product, 
    warranty_months INT NOT NULL,
    purchase_link,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME NOT NULL
);

CREATE TABLE Status (
    status_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    status_name VARCHAR(50) NOT NULL,
    status_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME NOT NULL
);

CREATE TABLE Category_Ticket (
    category_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    category_name VARCHAR(50) NOT NULL,
    category_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME NOT NULL
);

CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    client_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    agent_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    product_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    status_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    purchase_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    is_urgent BOOLEAN DEFAULT NO,
    issue_details TEXT NOT NULL,
    category_description TEXT,
    contact_timeframe DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME NOT, 
    FOREIGN KEY (client_id) REFERENCES Users(user_id)
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id), --to be modified
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
    FOREIGN KEY (status_id) REFERENCES Status(status_id),--to be modified
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id)--to be modified
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    ticket_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
    product_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- to be modified
    payment_amount INT NOT NULL,
    payment_status ENUM('in progress', 'declined', 'successful'),
    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_type ENUM('PayPal'),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id) 
);

CREATE TABLE Purchase (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
);

CREATE TABLE Escalations (
    escalation_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
);

CREATE TABLE Updates (
    update_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, --to be modified
);
-- Modify Tables