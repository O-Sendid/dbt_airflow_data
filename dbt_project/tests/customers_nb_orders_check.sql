select full_name
from {{ ref('customers_nb_orders')}}
where nb_orders < 0
