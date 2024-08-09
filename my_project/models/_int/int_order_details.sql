with normalized_orders as (
    select
        details.order_detail_id,
        details.order_id,
        orders.order_at,
        orders.customer_phone,
        {{ normalize_phone_number('orders.customer_phone') }} as normalized_phone,
        products.brand_id,
        products.brand_name,
        details.product_id,
        products.product_name,
        products.product_price,
        details.order_qty,
        details.unit_sales
    from {{ ref('stg_order_details') }} as details
    left join {{ ref('int_orders') }} as orders 
    on details.order_id = orders.order_id
    left join {{ ref('int_products') }} as products 
    on details.product_id = products.product_id
)
select 
    *,
    case 
        when normalized_phone like '62%' then 'Indonesia'
        when normalized_phone like '91%' then 'India'
    end as country
from normalized_orders




