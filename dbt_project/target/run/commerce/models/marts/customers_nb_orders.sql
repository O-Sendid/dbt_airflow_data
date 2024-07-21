

  create  table "dbt_database"."marts"."customers_nb_orders__dbt_tmp"
  as (
    select full_name,
      count(order_id) nb_orders  
from "dbt_database"."staging"."stg_customersorders"
group by full_name
  );