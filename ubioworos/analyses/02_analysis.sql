{% set target_status = 'Status_100' %}

select
    order_id,
    customer_key,
    order_status_key
from {{ ref('bronze_dim_fact_table') }}
where order_status_key = '{{ target_status }}'