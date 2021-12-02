with customer as (
  select * from {{ ref('stg_customer')}} ),
orders as ( select * from {{ ref('stg_orders')}} ),
state_map as (  select * from {{ ref('stg_state')}} ),
final as  (
                select customer.customer_id, orders.order_id,
                case
                     orders.order_status
                     when 'delivered' then 1
                     else 0
                end
                  as order_status, state_map.state_name from orders
                  inner join customer on orders.customer_id = customer.customer_id
                  inner join state_map on customer.state_code = state_map.state_code )
select * from final
