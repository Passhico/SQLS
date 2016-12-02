select *
from web.compras_datos cd 
left join web.compras_articulos ca on ca.id_compras_datos = cd.id_compras_datos
where date(cd.fecha) = date(now())
and cd.eliminado <> 's'
and ca.id_producto > 1000000
group by pedido
