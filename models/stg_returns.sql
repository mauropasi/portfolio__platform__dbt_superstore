with source as (
    select * from {{ source('raw', 'returns') }}
),

transformed as (
    select
        "Order ID" as order_id,
        coalesce(cast(returned as boolean), true) as is_returned
    from source
)

select * from transformed
