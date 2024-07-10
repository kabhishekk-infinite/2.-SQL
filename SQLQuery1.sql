CREATE DATABASE Abhishek;

USE Abhishek;


CREATE TABLE data (
    username VARCHAR(100),
	email  VARCHAR(100),
	password VARCHAR(50),
    PRIMARY KEY (username)
);

CREATE TABLE data2 (
    username2 VARCHAR(100),
	email2  VARCHAR(100),
	password2 VARCHAR(50),
    PRIMARY KEY (username2)
);

INSERT INTO data (username, email, password)
VALUES ('ab1','ab1@try.com','AB1');

INSERT INTO data (username, email, password)
VALUES ('ab2','ab2@try.com','AB2');

INSERT INTO data (username, email, password)
VALUES ('ab3','ab3@try.com','AB3');

INSERT INTO data2 (username2, email2, password2)
VALUES ('ac1','ac1@try.com','AC1');

INSERT INTO data2 (username2, email2, password2)
VALUES ('ac2','ac2@try.com','AC2');

INSERT INTO data2 (username2, email2, password2)
VALUES ('ac3','ac3@try.com','AC3');


CREATE TABLE data3 (
 username3 VARCHAR(100),
 email3  VARCHAR(100),
 password3 VARCHAR(50),
 username VARCHAR(100),
 PRIMARY KEY (username3),
 FOREIGN KEY (username) REFERENCES data(username)
);

INSERT INTO data3 (username3, email3, password3, username)
VALUES ('ad1','ad1@try.com','AD1','ab1');

INSERT INTO data3 (username3, email3, password3, username)
VALUES ('ad2','ad2@try.com','AD2','ab2');

INSERT INTO data3 (username3, email3, password3, username)
VALUES ('ad3','ad3@try.com','AD3','ab3');


SELECT * FROM data3;

use Abhishek;

INSERT INTO data (username, email, password)
VALUES ('cc1','cc1@try.com','CC1');

select * from data;

INSERT INTO data3 (username3, email3, password3, username)
VALUES ('cc3','cc3@try.com','CC3','qwe');

Select * from data3;

INSERT INTO data3 (username)
VALUES ('qq1');

CREATE TABLE customers (
    customer_id INT NOT NULL IDENTITY(1,1),
    customer_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL IDENTITY(1,1),
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert into customers table
INSERT INTO customers (customer_name)
VALUES ('John Doe'), ('Jane Smith');

-- Insert into orders table
INSERT INTO orders (order_date, customer_id)
VALUES ('2024-07-09', 1), ('2024-07-10', 2);

-- Select from customers table
SELECT * FROM customers;

-- Select from orders table
SELECT * FROM orders;


CREATE TABLE data4 (
 username4 VARCHAR(100),
 email4  VARCHAR(100),
 password4 VARCHAR(50),
 username2 VARCHAR(100),
 PRIMARY KEY (username4),
 FOREIGN KEY (username2) REFERENCES data2 (username2)
);

INSERT INTO data4 (username4, email4, password4, username2)
VALUES ('ae1','ae1@try.com','AE1','ac1');

INSERT INTO data4 (username4, email4, password4, username2)
VALUES ('ae2','ae2@try.com','AE2','ac2');

INSERT INTO data4 (username4, email4, password4, username2)
VALUES ('ae3','ae3@try.com','AE3','ac3');


SELECT * FROM data;


delete from data
where password = 'AB2';

