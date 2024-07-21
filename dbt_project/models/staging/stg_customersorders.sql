

select  o.order_id,
        c.full_name,
        o.order_date,
        o.status
from {{ ref('stg_orders')}} as o
left join {{ ref('stg_customers')}}  as c on o.customer_id = c.id