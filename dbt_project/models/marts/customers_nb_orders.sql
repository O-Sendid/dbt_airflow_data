select full_name,
      count(order_id) nb_orders  
from {{ ref('stg_customersorders')}}
group by full_name
