select 
	ol.customer_order_id as order_id,
	sum(ol.quantity * s.quantity * mp.price) as full_cost
	from order_line ol
join specification s on ol.product_id = s.product_id
join material_price mp on s.material_id = mp.material_id
group by ol.customer_order_id;
