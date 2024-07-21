select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from "dbt_database"."staging"."stg_customers"
where id is null



      
    ) dbt_internal_test