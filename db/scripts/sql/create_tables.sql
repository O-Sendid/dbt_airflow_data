DROP SCHEMA IF EXISTS raw CASCADE;

CREATE SCHEMA IF NOT EXISTS raw;


CREATE TABLE IF NOT EXISTS raw.customers (
    id int PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255)
);

CREATE TABLE IF NOT EXISTS raw.orders (
    id int PRIMARY KEY,
    user_id int,
    order_date date,
    status varchar(255),
    _etl_loaded_at timestamp NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw.payment (
    id int PRIMARY KEY,
    orderid int,
    paymentmethod varchar(255),
    status varchar(255),
    amount integer,
    created date,
    _batched_at timestamp NOT NULL DEFAULT NOW()
);