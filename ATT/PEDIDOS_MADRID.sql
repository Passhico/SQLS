select 
	cd.pedido,
 if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) as fecha_creacion_pedido,
 fp.fecha_entrega_prevista  , 
 fp.fecha_envio_prevista, 
 fp.fecha_envio_prevista_str, 
 if ( locate('-', cd.enviado) = '3', STR_TO_DATE(cd.enviado,'%d-%m-%Y'), STR_TO_DATE(cd.enviado,'%Y-%m-%d')) as enviado
from 
	web.compras_datos cd 
	left join web.fechas_pedidos fp on fp.id_compras_datos = cd.id_compras_datos
	left join web.compras_articulos_almacen a on a.id_compras_datos = cd.id_compras_datos
where 
	if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) > '2016-11-20'
	and cd.eliminado <> 's' 
	and cd.enviado = 'no'
	and  a.id_almacen = 28
	and fp.fecha_entrega_prevista <= date(now())
	
group by 
	cd.pedido	
order by 
	fecha_creacion_pedido asc

