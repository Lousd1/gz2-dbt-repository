SELECT  date_date,
        orders_id,
        products_id,
        revenue,
        quantity,
        purchase_price,
        ROUND(s.revenue - s.quantity*p.purchase_price,2) AS margin,
        ROUND(s.quantity * p.purchase_price,2) AS purchase_cost
FROM {{ ref("stg_raw__sales") }}  as s
LEFT JOIN {{ ref("stg_raw__product") }} as p
USING (products_id)
