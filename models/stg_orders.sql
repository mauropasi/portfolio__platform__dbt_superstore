with source as (
    select * from {{ source('raw', 'orders') }}
),

transformed as (
    select
        cast("Row ID" as integer) as row_id,
        "Order ID" as order_id,
        cast("Order Date" as date) as order_date,
        cast("Ship Date" as date) as ship_date,
        "Ship Mode" as ship_mode,
        "Customer ID" as customer_id,
        "Customer Name" as customer_name,
        segment as customer_segment,
        "Country/Region" as country,
        city,
        "State/Province" as state,
        cast("Postal Code" as varchar) as postal_code,
        region,
        "Product ID" as product_id,
        category,
        "Sub-Category" as sub_category,
        "Product Name" as product_name,
        cast(sales as double) as sales_amount,
        cast(quantity as integer) as quantity,
        cast(discount as double) as discount_rate,
        cast(profit as double) as profit_amount
    from source
)

select * from transformed
