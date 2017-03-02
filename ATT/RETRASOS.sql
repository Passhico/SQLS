select 
sum(if(art.ASTOCK = 0 , 1 , 0)) as n_articulos_agotados, 
 art.ACODAR, 
 art.ASTOCK, 
 art.ADESCR, 
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
	left join xgestevo.fcart001 art on art.ACODAR = a.id_articulo
where 
	if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) > '2016-11-20'
	and art.ACODAR > 11000 and art.ACODAR not in (20000)
	and cd.eliminado <> 's' 
	and cd.enviado = 'no'
	and  a.id_almacen <> 28
	and fp.fecha_entrega_prevista <= date(now())
	and cd.envio = 'urgente'

 group by 
	cd.pedido 	
having 
 /*Ningún artículo agotado*/
 sum(if(art.ASTOCK = 0 , 1 , 0)) = 0

order by 
	fecha_creacion_pedido asc, art.ASTOCK asc
;

/****************************************************************/
set @pedido = '22016553203'; 

select 

 art.ACODAR, 
 art.ASTOCK, 
 art.ADESCR, 
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
	left join xgestevo.fcart001 art on art.ACODAR = a.id_articulo
where 
	if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) > '2016-11-20'
	and cd.eliminado <> 's' 
	and cd.enviado = 'no'
	and  a.id_almacen <> 28
	and fp.fecha_entrega_prevista <= date(now())
	and cd.pedido = @pedido
order by 
	fecha_creacion_pedido asc, art.ASTOCK asc


	

