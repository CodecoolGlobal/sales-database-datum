DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    order_number      INT PRIMARY KEY,
    order_line_number INT  NOT NULL,
    order_date        date NOT NULL,
    status            text NOT NULL,
    deal_size         text,
    customer_id       INT  NOT NULL
);

ALTER TABLE ONLY orders
    ADD CONSTRAINT order__customer_id_fk
        FOREIGN KEY (customer_id) REFERENCES customer (id);

DROP TABLE IF EXISTS order_line;

CREATE TABLE order_line
(
    order_line_number INT NOT NULL,
    order_number      INT NOT NULL,
    product_code      INT NOT NULL,
    price_each        INT NOT NULL,
    quantity          INT NOT NULL,
    category_id       INT
);

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line__order_number__fk
        FOREIGN KEY (order_number) REFERENCES orders (order_number),
    ADD CONSTRAINT order__product_code__fk
        FOREIGN KEY (product_code) REFERENCES product (product_code);

DROP TABLE IF EXISTS product;

CREATE TABLE product
(
    product_code        text PRIMARY KEY,
    price               DECIMAL NOT NULL,
    product_category_id INT     NOT NULL,
    msrp                INT     NOT NULL
);

ALTER TABLE ONLY product
    ADD CONSTRAINT product__product_category_id__fk
        FOREIGN KEY (product_category_id) REFERENCES product_category (id);


DROP TABLE IF EXISTS product_category;

CREATE TABLE product_category
(
    id           SERIAL PRIMARY KEY,
    product_line text
);


DROP TABLE IF EXISTS customer;

CREATE TABLE customer
(
    id                         SERIAL PRIMARY KEY,
    name                       text,
    customer_representative_id INT,
    address_id                 INT NOT NULL
);

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer__customer_representative_id__fk
        FOREIGN KEY (customer_representative_id) REFERENCES customer_representative (id),
    ADD CONSTRAINT customer__address_id__fk
        FOREIGN KEY (address_id) REFERENCES address (id);


DROP TABLE IF EXISTS customer_representative;

CREATE TABLE customer_representative
(
    id         SERIAL PRIMARY KEY,
    first_name text,
    last_name  text,
    phone      text NOT NULL

);


DROP TABLE IF EXISTS address;

CREATE TABLE address
(
    id             SERIAL PRIMARY KEY,
    territory      text,
    country        text,
    city           text,
    state          text,
    postal_code    text,
    address_line_1 text,
    address_line_2 text
);