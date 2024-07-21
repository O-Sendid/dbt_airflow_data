
  create view "dbt_database"."commerce"."stg_customers_orders__dbt_tmp" as (
    with view_orders_cust as  (

select ord.id,cus.first_name,ord.status
from raw.orders as ord
left join raw.customers as cus on ord.user_id = cus.id

)
select * from view_orders_cust
  );