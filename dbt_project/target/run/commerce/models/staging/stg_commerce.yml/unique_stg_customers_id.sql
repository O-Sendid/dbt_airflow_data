select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    id as unique_field,
    count(*) as n_records

from "dbt_database"."staging"."stg_customers"
where id is not null
group by id
having count(*) > 1



      
    ) dbt_internal_test