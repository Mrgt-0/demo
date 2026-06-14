SELECT 
    op.order_id,
    SUM(op.quantity * ps.quantity_unit * mp.price) AS full_cost
FROM order_line op
JOIN product_specification ps ON op.product_id = ps.production_id
JOIN material_price mp ON ps.material_id = mp.material_id
GROUP BY op.order_id;