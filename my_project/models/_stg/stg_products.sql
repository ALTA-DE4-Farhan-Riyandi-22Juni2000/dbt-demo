select
    product_id::int as product_id
    , brand_id::int as brand_id
    , name as product_name
    , price as product_price
from {{source('store', 'products')}}