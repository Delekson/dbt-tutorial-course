with source as (
    select *
    from {{ source('thelook_ecommerce', 'order_items') }}
),

renamed as (
    select
        id as order_item_id,
        order_id,
        product_id,
        inventory_item_id,
        sale_price
    from source
)

{#
    The following columns will be inferred from the stg orders table:
        user_id
        order_status,
        created_at,
        shipped_at,
        delivered_at,
        returned_at,
#}

select *
from renamed
