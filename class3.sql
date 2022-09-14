CREATE DATABASE class3;
USE  class3;
-------------------------------------------------------------
CREATE TABLE customers (
    customer_id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    fist_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(10),
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(50),
    province VARCHAR(50),
    code VARCHAR(15),
    country VARCHAR(50) NOT NULL,
    sales_rep_employee_number INT NOT NULL,
    credit_limit INT
);

INSERT INTO customers (last_name, city, country, sales_rep_employee_number)
    VALUES ('wolfe', 'calgary', 'canada', 53);

INSERT INTO customers (fist_name, last_name, city, country, sales_rep_employee_number)
    VALUES ('Margaret', 'artwood', 'vancouver', 'canada', 40);
---------------------------------------------------------------

ALTER TABLE customers MODIFY fist_name VARCHAR(50) NOT NULL;
--ERROR 1138 (22004): Invalid use of NULL value

ALTER TABLE customers MODIFY fist_name VARCHAR(50) default ''; --no error didnt work
update customers set fist_name='' where fist_name IS NULL; --this works 
ALTER TABLE customers MODIFY fist_name VARCHAR(50) NOT NULL;-- now we can add not null 

SHOW CREATE TABLE customers;

---------------------------------------------------------
CREATE TABLE orders (
    order_number INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    fk_customer_id INT NOT NULL,
    order_date DATETIME,
    required_date DATETIME,
    shipped_date DATETIME,
    order_status INT,
    comments TEXT,
    FOREIGN KEY (fk_customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
);

INSERT INTO orders (fk_customer_id, order_date, order_status)
      VALUES (1, '2022-09-08', 2);

INSERT INTO orders (fk_customer_id, order_date, order_status)
    VALUES (2, '2022-03-08', 1);

    INSERT INTO orders (fk_customer_id, order_date, order_status)
    VALUES (2, '2022-08-23', 2);
-----------------------------------------------------------------
