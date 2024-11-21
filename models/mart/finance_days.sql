--{{ config(materialized="table") }}

  select
        O.date_date,
        count(distinct S.orders_id) as total_transactions,
        ROUND((sum(O.revenue)),2) as total_revenue,
        ROUND((avg(O.revenue)),2) as average_basket,
        ROUND((sum(O.operational_margin)),2) as total_operational_margin,
        ROUND((sum(O.purchase_cost)),2) as total_purchase_cost,
        ROUND((sum(S.shipping_fee)),2) as total_shipping_fees,
        ROUND((sum(S.logcost)),2) as total_log_costs,
        ROUND((sum(O.quantity)),2) as total_quantity_sold
   from {{ ref('int_orders_operational') }} as O
    join {{ ref('stg_gz_raw_data__raw_gz_ship') }} as S
    on O.orders_id = S.orders_id
    Group by O.date_date
  