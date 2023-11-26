with source as (
        select *
        from {{ source('thelook_ecommerce', 'orders') }}
),

renamed as (
        select
                order_id,
                user_id,
                status as order_status,
                created_at,
                shipped_at,
                delivered_at,
                returned_at,
                num_of_item
        from source
)

select *
from renamed