
  create view "dbt_database"."staging"."stg_orders__dbt_tmp" as (
    SELECT
    id AS order_id,
    user_id AS customer_id,
    order_date,
    status
FROM
    raw.orders
  );