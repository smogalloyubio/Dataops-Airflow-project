select *
from {{ source('bronze_source', 'promo_product') }}