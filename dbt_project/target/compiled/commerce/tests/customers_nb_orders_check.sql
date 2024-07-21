select full_name
from "dbt_database"."marts"."customers_nb_orders"
where nb_orders < 0