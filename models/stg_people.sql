with source as (
    select * from {{ source('raw', 'people') }}
),

transformed as (
    select
        region,
        "Regional Manager" as regional_manager
    from source
)

select * from transformed
