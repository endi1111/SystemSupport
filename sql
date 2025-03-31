-- Database: support_system
CREATE DATABASE IF NOT EXISTS support_system;
USE support_system;

-- Tables
CREATE TABLE Roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    role_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, --to be modified
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    role_id INT NOT NULL,
    external_client_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

-- Add other tables (Agents, Tickets, Products, etc.) here...