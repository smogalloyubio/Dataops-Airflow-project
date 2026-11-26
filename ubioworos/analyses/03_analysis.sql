{% set discount_status = 'Status_100' %}
{% set col_name= ['shipping_fee','tax_rate'] %}

SELECT
    order_id,
    customer_key,
    order_date,
    quantity,
    unit_price,
    {{ multiply('quantity', 'unit_price') }} as gross_amount,
    {% for col in col_name %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ ref('bronze_dim_fact_table') }}
WHERE order_status_key = '{{ discount_status }}'