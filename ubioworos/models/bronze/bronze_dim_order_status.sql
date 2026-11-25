SELECT
    *
FROM {{ source('source', 'dim_order_status') }}