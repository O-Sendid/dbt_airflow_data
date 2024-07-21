
  create view "dbt_database"."staging"."stg_customersorders__dbt_tmp" as (
    select  o.order_id,
        c.full_name,
        o.order_date,
        o.status
from "dbt_database"."staging"."stg_orders" as o
left join "dbt_database"."staging"."stg_customers"  as c on o.customer_id = c.id
  );