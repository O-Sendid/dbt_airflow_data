select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select full_name
from "dbt_database"."marts"."customers_nb_orders"
where nb_orders < 0
      
    ) dbt_internal_test