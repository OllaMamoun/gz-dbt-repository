SELECT
    a.orders_id,
    a.date_date,
    a.margin,
    sh.shipping_fee,
    sh.logcost,
    a.revenue,
    a.purchase_cost,
    quantity,
    CAST(sh.ship_cost AS FLOAT64) AS ship_cost,
    ROUND((margin + shipping_fee - logcost - ship_cost) ,3) AS operational_margin
FROM {{ ref('int_sales_margin') }} AS a
JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} AS sh
ON a.orders_id = sh.orders_id



