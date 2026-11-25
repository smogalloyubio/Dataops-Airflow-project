SELECT
    location_key,
    city,
    country,
    postal_code
FROM {{ source('source', 'dim_location') }}
where location_key is not null