with view_orders_cust as  (

select ord.id,cus.first_name,ord.status
from raw.orders as ord
left join raw.customers as cus on ord.user_id = cus.id

)
select * from view_orders_cust