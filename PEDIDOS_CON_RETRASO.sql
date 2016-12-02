select 
	 cd.pedido, 
	 fp.fecha_envio_prevista, 
	 fp.fecha_entrega_prevista, 
	 fp.fecha_entrega_prevista_str, 
	 cd.enviado, 
	/* ci.notificado, */
	 cd.eliminado, 
	 cd.albaran, 
	 if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) as fecha_pedido, 
	 DATEDIFF(if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) ,date(now())) as desde_fecha_pedido,
	 DATEDIFF(fp.fecha_entrega_prevista,date(now())) as desde_fecha_prevista_entrega
	 
from 
	web.compras_datos cd 
	left join web.fechas_pedidos fp on cd.id_compras_datos = fp.id_compras_datos
	/*left join  web.compras_incidencias ci on cd.id_compras_datos = ci.id_compras_datos */

where 
	year(cd.fecha >= 2016) and 
/*	ci.notificado = NULL or ci.notificado = 'n' and */
	cd.albaran = 'n' and
	cd.enviado ='no' and 
	cd.eliminado <> 'n' and 
	fp.fecha_envio_prevista  <= date( now() ) and  
	left(cd.pedido , 1 ) not in ('8') /*SIN RMAS*/
	
limit 100  