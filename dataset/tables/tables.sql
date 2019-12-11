DROP TABLE IF EXISTS order;

CREATE TABLE order (
    order_number INT PRIMARY KEY,
    quantity INT NOT NULL,
    order_line_number INT NOT NULL,
    order_date date NOT NULL,
    status_id INT NOT NULL,
    deal_size text,
    category_id INT
);

DROP TABLE IF EXISTS order_line;

CREATE TABLE order_line (
    order_line_number INT NOT NULL,
    order_number INT NOT NULL,
    product_code INT NOT NULL
);

DROP TABLE IF EXISTS product;

CREATE TABLE product (
    product_code INT PRIMARY KEY,
    price DECIMAL NOT NULL,
    product_category_id INT NOT NULL ,
    msrp INT NOT NULL
);

DROP TABLE IF EXISTS product_category;

CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    product_line text
);

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    name text PRIMARY KEY,
    customer_representative_id INT,
    phone text NOT NULL,
    address_id INT NOT NULL,
    representative_id INT
);

DROP TABLE IF EXISTS customer_representative;

CREATE TABLE customer_representative (
    id SERIAL PRIMARY KEY,
    first_name text,
    last_name text
);

DROP TABLE IF EXISTS address;

CREATE TABLE address (
    territory text,
    country text,
    city text,
    state text,
    postal_code text,
    address_line_1 text,
    address_line_2 text
);