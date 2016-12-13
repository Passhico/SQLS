select retrasos.ACODAR,retrasos.responsable,  count(*) as pedidos_con_posible_retraso_sin_notificar
from (
		select 
		count(*), 
		(select id_compras_datos from web.compras_incidencias i where i.id_compras_datos = cd.id_compras_datos group by i.id_compras_datos) as notificado, 
		( 
			select cr.email
			from  web.familias_responsables fr
			left join web.compras_responsables cr  on cr.id_compras_responsables = fr.id_compras_responsables
			left join web.familias f on f.id_familia= fr.id_familia
			where f.id_familia = art.AFAMILIA
		) as responsable, 
		if(art.ASTOCK = 0 , 1 , 0) as n_articulos_agotados, 
		 art.ACODAR, 
		 art.ASTOCK, 

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
			left join web.compras_articulos ca on ca.id_compras_datos = cd.id_compras_datos
		where 
			if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) > '2016-11-20'
			and art.ACODAR > 11000 and art.ACODAR not in (20000, 31046)
			and cd.eliminado <> 's' 
			and cd.enviado = 'no'
			and fp.fecha_entrega_prevista <= current_date
			and cd.envio = 'urgente'
		group by 
		  cd.pedido
		having 
			sum(n_articulos_agotados) = 0 
			and notificado is  null
		
		order by 
			fecha_creacion_pedido asc, art.ASTOCK asc
			) retrasos

group by retrasos.ACODAR 
order by count(*) desc
;
