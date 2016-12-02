
set @fecha_desde='2016-05-31';
set @fecha_hasta='2016-06-16';
set @agencia='%seur%';


/*Siniestrados*/
select count(*) 
from 
	pccom_returns pr 
left join 
	web.compras_datos cd on cd.pedido=pr.firstReference
where 
	created between @fecha_desde and @fecha_hasta
	and pr.typeId=3 and pr.subtypeId=3
	and pr.reasonId in (3,8,10)
	and cd.transporte_seleccionado like @agencia
into @total_pedidos_siniestrados;

/*Enviados*/
select 
	count(*)
from 
	web.compras_datos cd 
where 
	cd.transporte_seleccionado like @agencia
	and eliminado='n'
	and enviado <> 'no'
into @total_pedidos_efectuados;


/*Totales*/
select  @agencia ,@total_pedidos_siniestrados, @total_pedidos_efectuados, ( @total_pedidos_siniestrados / @total_pedidos_efectuados ) * 100 as ratio_siniestros;


/*INFOS
select * from pccom_returns_subtypes;
select * from pccom_returns_types;
select * from pccom_returns_reason;
*/