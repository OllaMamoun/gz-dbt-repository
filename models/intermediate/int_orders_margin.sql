SELECT
    date_date,
    orders_id,
    ROUND(SUM(revenue),3)AS revenue,
    ROUND(SUM(quantity),3) AS quantity,
    ROUND(SUM(purchase_cost),3) AS purchase_cost,
    ROUND(SUM(margin),3) AS margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id ,date_date
ORDER BY date_date DESC
