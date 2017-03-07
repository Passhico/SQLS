select 
	w.orderNumber				  as EV_ALMACEN_ALBARANAR_PEDIDO_pedido,
	count(*),					  as lineas_en_pedido
	w.user						  as id_user, 
    'EV_ALMACEN_ALBARANAR_PEDIDO' as `EVENTO`, 
	w.dateWaybilled				  as dt, 
    date(w.dateWaybilled) as fecha ,  
	time(w.dateWaybilled) as hora, 

    w.orderNumber				  as EV_ALMACEN_ALBARANAR_PEDIDO_pedido,
    w.stickerSuffix 		  as EV_ALMACEN_ALBARANAR_PEDIDO_bulto   
FROM 
	componentes.logistic_to_waybill w
	inner join componentes.pccom_logistic_orders_stickers_articles a ON w.orderNumber = a.orderNumber AND CAST(w.stickerSuffix AS UNSIGNED) = a.stickerSuffix
group by EV_ALMACEN_ALBARANAR_PEDIDO_pedido

limit 1000;