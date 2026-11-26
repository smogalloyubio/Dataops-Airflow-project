{% set use_left_join = true %}
{% set join_type = 'left join' if use_left_join else 'inner join' %}

select
    f.order_id,
    f.customer_key,
    f.product_key,
    f.payment_key,
    f.quantity,
    f.unit_price,
    f.discount_pct,
    f.shipping_fee,
    c.customer_name,
    p.product_name,
    p.product_category,
    py.payment_method,
    {{ multiply('f.quantity', 'f.unit_price') }} as gross_amount,
    {{ multiply('f.quantity', 'f.unit_price') }} * (1 - coalesce(f.discount_pct, 0)) as discounted_amount
from {{ ref('bronze_dim_fact_table') }} as f
{{ join_type }} {{ ref('bronze_dim_customer') }} as c
    on f.customer_key = c.customer_key
{{ join_type }} {{ ref('bronze_dim_product') }} as p
    on f.product_key = p.product_key
{{ join_type }} {{ ref('bronze_dim_payment') }} as py
    on f.payment_key = py.payment_key