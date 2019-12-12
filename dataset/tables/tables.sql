DROP TABLE IF EXISTS order;
DROP TABLE IF EXISTS order_line;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_representative;
DROP TABLE IF EXISTS address;


CREATE TABLE order
(
    order_number      INT PRIMARY KEY,
    order_line_number INT  NOT NULL,
    order_date        date NOT NULL,
    status            TEXT NOT NULL,
    deal_size         text,
    customer_id       INT  NOT NULL
);

ALTER TABLE ONLY order
    ADD CONSTRAINT order__customer_id_fk
        FOREIGN KEY (customer_id) REFERENCES customer (id);

CREATE TABLE order_line
(
    order_number INT     NOT NULL,
    product_code INT     NOT NULL,
    quantity     INT     NOT NULL,
    price        DECIMAL NOT NULL
);

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line__order_number__fk
        FOREIGN KEY (order_number) REFERENCES order (order_number),
    ADD CONSTRAINT order__product_code__fk
        FOREIGN KEY (product_code) REFERENCES product (product_code);

CREATE TABLE product
(
    product_code        TEXT PRIMARY KEY,
    product_category_id INT NOT NULL,
    msrp                INT NOT NULL
);

ALTER TABLE ONLY product
    ADD CONSTRAINT product__product_category_id__fk
        FOREIGN KEY (product_category_id) REFERENCES product_category (id);


CREATE TABLE product_category
(
    id           SERIAL PRIMARY KEY,
    product_line text
);


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


CREATE TABLE customer_representative
(
    id         SERIAL PRIMARY KEY,
    first_name text,
    last_name  text,
    phone      text NOT NULL

);


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