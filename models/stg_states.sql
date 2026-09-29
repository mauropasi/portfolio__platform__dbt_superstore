with source as (
    select * from {{ ref('raw_states') }}
),

transformed as (
    select
        state_code,
        upper(state_name)   as state_name,
        population,
        num_counties,
        founded_year,
        -- derived helper columns
        (2024 - founded_year) as years_since_statehood
    from source
)

select * from transformed
