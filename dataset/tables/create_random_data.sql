INSERT INTO customer_representative (first_name, last_name, phone)
SELECT left(md5(i::text), 8),
       left(md5(random()::text), 12),
       left(md5(random()::text), 15)
FROM generate_series(1, 1000000) s(i);

INSERT INTO address (territory, country, city, state, postal_code, address_line_1, address_line_2)
SELECT left(md5(i::text), 5),
       left(md5(random()::text), 8),
       left(md5(random()::text), 10),
       left(md5(random()::text), 4),
       left(md5(random()::text), 8),
       left(md5(random()::text), 16),
       left(md5(random()::text), 8)
FROM generate_series(1, 1000000) s(i);

INSERT INTO customer (name, customer_representative_id, address_id)
SELECT left(md5(i::text), 18),
       cast(left(i::text, 8) AS integer),
       cast(left(i::text, 8) AS integer)
FROM generate_series(93, 1000092) s(i);



