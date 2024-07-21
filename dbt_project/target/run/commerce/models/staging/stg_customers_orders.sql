

  create  table "dbt_database"."marts"."stg_customers_orders__dbt_tmp"
  as (
    
SELECT
    id AS order_id,
    user_id AS customer_id,
    order_date,
    status
FROM
    raw.orders
  );