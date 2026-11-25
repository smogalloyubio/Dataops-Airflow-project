SELECT
    *
FROM {{ source('source', 'fact_table') }}