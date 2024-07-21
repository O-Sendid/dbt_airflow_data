select *,
concat(first_name,' ',last_name) as full_name
from "dbt_database"."raw"."customers"