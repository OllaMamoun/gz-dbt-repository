with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_sales') }}

),

renamed as (

    select
        --concat (orders_id,"_",pdt_id) as products_id,
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity

    from source

)

select * from renamed
