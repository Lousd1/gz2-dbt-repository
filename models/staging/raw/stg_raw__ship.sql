with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost As float64) as ship_cost

    from source

)

select * from renamed
ORDER BY orders_id DESC