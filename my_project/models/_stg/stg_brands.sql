select 
    brand_id::int as brand_id
    , name as brand_name
from {{source('store', 'brands')}}