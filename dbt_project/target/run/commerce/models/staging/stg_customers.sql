
  create view "dbt_database"."staging"."stg_customers__dbt_tmp" as (
    select *,
concat(first_name,' ',last_name) as full_name
from  raw.customers
  );