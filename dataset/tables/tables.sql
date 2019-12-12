DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_line;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_representative;
DROP TABLE IF EXISTS address;

CREATE TABLE address
(
    id             SERIAL primary key,
    territory      text,
    country        text,
    city           text,
    state          text,
    postal_code    text,
    address_line_1 text,
    address_line_2 text
);

CREATE TABLE customer_representative
(
    id         SERIAL PRIMARY KEY,
    first_name text,
    last_name  text,
    phone      text NOT NULL
);

CREATE TABLE product_category
(
    id           SERIAL PRIMARY KEY,
    product_line text
);


CREATE TABLE product
(
    product_code        TEXT PRIMARY KEY,
    product_category_id INT,
    msrp                INT NOT NULL
);

CREATE TABLE customer
(
    id                         SERIAL PRIMARY KEY,
    name                       text,
    customer_representative_id INT,
    address_id                 INT
);


CREATE TABLE orders
(
    order_number INT PRIMARY KEY,
    order_date   text NOT NULL,
    status       text,
    customer_id  INT
);


CREATE TABLE order_line
(
    order_number INT     NOT NULL,
    product_code text     NOT NULL,
    quantity     INT     NOT NULL,
    price        numeric NOT NULL
);




INSERT INTO address(territory, country, city, state, postal_code, address_line_1, address_line_2)
SELECT DISTINCT territory,
                country,
                city,
                state,
                postalcode,
                addressline1,
                addressline2
FROM sales_data_sample;

INSERT INTO customer_representative(first_name, last_name, phone)
SELECT DISTINCT contactfirstname,
                contactlastname,
                phone
FROM sales_data_sample;

INSERT INTO product_category(product_line)
SELECT DISTINCT productline
FROM sales_data_sample;

INSERT INTO product(product_code, msrp)
SELECT DISTINCT productcode,
                msrp
FROM sales_data_sample;

INSERT INTO customer(name)
SELECT DISTINCT customername
FROM sales_data_sample;

INSERT INTO orders(order_number, order_date, status)
SELECT DISTINCT ordernumber,
                orderdate,
                status
FROM sales_data_sample;

INSERT INTO order_line(order_number, product_code, quantity, price)
SELECT DISTINCT ordernumber,
                productcode,
                quantityordered,
                priceeach
FROM sales_data_sample;


-- ALTER TABLE ONLY orders
--     ADD CONSTRAINT order__customer_id_fk
--         FOREIGN KEY (customer_id) REFERENCES customer (id);
--
-- ALTER TABLE ONLY product
--     ADD CONSTRAINT product__product_category_id__fk
--         FOREIGN KEY (product_category_id) REFERENCES product_category (id);
--
-- ALTER TABLE ONLY order_line
--     ADD CONSTRAINT order_line__order_number__fk
--         FOREIGN KEY (order_number) REFERENCES orders (order_number),
--     ADD CONSTRAINT order__product_code__fk
--         FOREIGN KEY (product_code) REFERENCES product (product_code);
--
-- ALTER TABLE ONLY customer
--     ADD CONSTRAINT customer__customer_representative_id__fk
--         FOREIGN KEY (customer_representative_id) REFERENCES customer_representative (id),
--     ADD CONSTRAINT customer__address_id__fk
--         FOREIGN KEY (address_id) REFERENCES address (id);

