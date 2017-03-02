select *
from 
	pccom_returns r 
left join pccom_returns_types t on r.typeId = t.typeId
left join pccom_returns_subtypes st on r.subtypeId = st.subtypeId
where 
	t.name = 'INCIDENCIA' 
	and 
	st.name = 'ARTICULO' 
	and
	r.reference in (
							select 
								distinct(cd.pedido) as PedidoConRastrilloOReacondicionado 
							 /* ca.id_producto,
							   ca.nombre */
							from compras_datos cd 
								left join compras_articulos ca on cd.id_compras_datos = ca.id_compras_datos
							where 
								ca.id_producto > 900000 /*Rastrillos*/
								or
								ca.nombre like '%reacondicionado%'
						)

