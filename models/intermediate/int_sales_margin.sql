
SELECT date_date
, orders_id
, b.products_id
, revenue
, quantity
, purchase_price
, quantity * purchase_price AS purchase_cost
, (revenue - quantity * purchase_price ) AS margin
FROM{{ ref('stg_gz_raw_data__raw_gz_sales') }} AS a
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS b
ON  a.products_id = b.products_id
ORDER BY date_date DESC