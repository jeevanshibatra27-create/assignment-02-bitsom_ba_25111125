-- Q1.2: Schema Design in 3NF

-- 1. Sales Representatives Table
CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

-- 2. Customers Table
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- 3. Products Table
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- 4. Orders Table (Header info)
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

-- 5. Order Details Table (Line items)
CREATE TABLE OrderDetails (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- INSERT STATEMENTS (5 rows per table as per assignment)

INSERT INTO SalesReps VALUES 
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR04', 'Sania Mirza', 'sania@corp.com', 'Hyderabad Hub, HITEC City - 500081'),
('SR05', 'Vikram Rathore', 'vikram@corp.com', 'Chennai Branch, T. Nagar - 600017');

INSERT INTO Customers VALUES 
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Suresh Raina', 'suresh@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO Products VALUES 
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200);

INSERT INTO Orders VALUES 
('ORD1001', 'C001', 'SR01', '2023-01-10'),
('ORD1002', 'C002', 'SR02', '2023-01-17'),
('ORD1003', 'C003', 'SR03', '2023-02-05'),
('ORD1004', 'C004', 'SR05', '2023-02-12'),
('ORD1005', 'C005', 'SR01', '2023-03-01');

INSERT INTO OrderDetails VALUES 
('ORD1001', 'P001', 1),
('ORD1002', 'P005', 2),
('ORD1003', 'P003', 1),
('ORD1004', 'P002', 5),
('ORD1005', 'P004', 10);
