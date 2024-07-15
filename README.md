# dbt_airflow_data


## Docker setup DBT & PostgreSQL


docker-compose down

docker-compose build


docker-compose up -d

docker-compose exec dbt bash


apt-get update
apt-get install -y postgresql-client


psql -h postgres -U dbt_user -d postgres

\c dbt_database
\dt

select * from raw.customers;

select * from raw.orders;

select * from raw.payment;






