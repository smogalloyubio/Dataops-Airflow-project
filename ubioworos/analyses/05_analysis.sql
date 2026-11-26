select 
    f.order_id,
    f.order_date,
    f.customer_key,
    c.customer_name,
    f.quantity,
    f.unit_price,
    {{ multiply('f.quantity', 'f.unit_price') }} as gross_amount
from 
        {{ ref('bronze_dim_fact_table') }}  as f 
join 
        {{ ref('bronze_dim_customer') }}  as c 
on f.customer_key = c.customer_key
