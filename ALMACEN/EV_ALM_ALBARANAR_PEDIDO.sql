

        /*campos comunes ID , EVENTO , DT , FECHA , HORA , ID_USER */


# Numnero de lineas por usuario y dias
select
	    w.user AS id_user, 
	    'EV_ALMACEN_ALBARANAR_PEDIDO' as `EVENTO`, 
    w.orderNumber pedido,
    w.stickerSuffix bulto,

    date(w.dateWaybilled) fecha,
    time(w.dateWaybilled) hora, 
    w.dateWaybilled 
    
FROM componentes.logistic_to_waybill w
inner join componentes.pccom_logistic_orders_stickers_articles a ON w.orderNumber = a.orderNumber AND CAST(w.stickerSuffix AS UNSIGNED) = a.stickerSuffix
WHERE
    DATE(w.dateWaybilled) = '2016-01-27' and
    w.user = '14630349A'
    
LIMIT 10

