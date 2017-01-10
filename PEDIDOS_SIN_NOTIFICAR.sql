set @dia_desde = '2017-01-04';
set @dia_hasta = '2017-01-04';

select 
		@dia_pedido, 
		(	select cr.email
			from  web.familias_responsables fr
			left join web.compras_responsables cr  on cr.id_compras_responsables = fr.id_compras_responsables
			left join web.familias f on f.id_familia= fr.id_familia
			left join web.articulos a on a.id_familia = f.id_familia
			where a.id_articulo = retrasos.id_producto
		) as responsable , 
	concat('http://admin.pccomponentes.com/quovadis/admin_pedido.php?id_pedido=', retrasos.pedido) as pedido, 
   sum(agotado) as n_articulos_agotados, 
   retrasos.*
  
from	
		(select 
		if ( (select id_compras_datos from web.compras_incidencias i where i.id_compras_datos = cd.id_compras_datos group by i.id_compras_datos) is null, false, true) as pedido_notificado, 
		 ca.id_producto , 
		 ca.nombre, 
		 stock_murcia.ASTOCK as stock_murcia, 
		 stock_madrid.ASTOCK as stock_madrid,
		 stock_murcia.ASTOCK + stock_madrid.ASTOCK as  stock_total, 
		 if ( stock_murcia.ASTOCK + stock_madrid.ASTOCK <= 0 and  stock_murcia.ASTOCK + stock_madrid.ASTOCK is not null, true , false ) as agotado , 
		 	cd.pedido,
		 if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) as fecha_creacion_pedido,
		 if ( locate('-', cd.enviado) = '3', STR_TO_DATE(cd.enviado,'%d-%m-%Y'), STR_TO_DATE(cd.enviado,'%Y-%m-%d')) as enviado , 
		 fp.*
		 
		from 
			web.compras_datos cd 
			inner join web.compras_articulos ca on ca.id_compras_datos = cd.id_compras_datos 
			left join web.fechas_pedidos fp on fp.id_compras_datos = cd.id_compras_datos 
		   left join xgestevo.fcstk001 stock_murcia on ca.id_producto = stock_murcia.ACODAR and stock_murcia.AALM in (1)
		   left join xgestevo.fcstk001 stock_madrid on ca.id_producto = stock_madrid.ACODAR and stock_madrid.AALM in (28)
		where 
			if ( locate('-', cd.fecha) = '3', STR_TO_DATE(cd.fecha,'%d-%m-%Y'), STR_TO_DATE(cd.fecha,'%Y-%m-%d')) between @dia_desde and @dia_hasta
			and ca.id_producto  > 11000 and ca.id_producto not in (20000/*descuento*/, 31046/*montaje*/, 31045, 'TEXTO', 'MON8672' , 74623 /*TARJETAREGALO*/)
			and cd.eliminado <> 's' 
			and cd.enviado = 'no'
			and fp.fecha_entrega_prevista <= adddate(current_date, 0)
			and cd.envio = 'urgente'
			and cd.transporte_seleccionado not in ('RedyserSameDay' , 'RedyserCanarias')
			and cd.pagado <> 'no' and cd.pagado <> current_date
			and cd.fechaexpedir = '0000-00-00' /*para quitar los programados*/
		group by ca.id_compras_articulo having max(fp.fecha_entrega_prevista)
		order by 
			stock_total desc , fecha_creacion_pedido asc, cd.pedido  asc
		) as retrasos
where pedido_notificado = false
group by retrasos.pedido 
order by n_articulos_agotados
/*having n_articulos_agotados > 0 (para sacar solo de compras)*/