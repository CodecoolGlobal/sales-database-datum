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

INSERT INTO product(product_code, msrp, product_category_id)
SELECT DISTINCT productcode,
                msrp,
                pc.id
FROM sales_data_sample sds
JOIN product_category pc ON pc.product_line = sds.productline;

INSERT INTO customer(name, customer_representative_id, address_id)
SELECT DISTINCT sds.customername,
                cr.id,
                a.id
FROM sales_data_sample sds
         JOIN address a ON sds.addressline1 = a.address_line_1
         JOIN customer_representative cr ON sds.phone = cr.phone;


INSERT INTO orders(order_number, order_date, status)--, customer_id)
SELECT DISTINCT sds.ordernumber,
                sds.orderdate,
                sds.status
                -- c.id
FROM sales_data_sample sds;
-- JOIN customer c ON c.name = sds.customername;

INSERT INTO order_line(order_number, product_code, quantity, price)
SELECT DISTINCT ordernumber,
                productcode,
                quantityordered,
                priceeach
FROM sales_data_sample;