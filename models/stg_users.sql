with source as (
    select * from {{ source('raw', 'raw_users') }}
),

transformed as (
    select
        id as user_id,
        upper(name) as user_name,
        lower(email) as user_email,
        cast(signup_date as date) as signup_date
    from source
)

select * from transformed
