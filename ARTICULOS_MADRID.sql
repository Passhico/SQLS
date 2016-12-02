select cd.pedido , cd.id_compras_datos , a.*
from web.compras_datos cd 
left join web.compras_articulos_almacen a on a.id_compras_datos = cd.id_compras_datos 
where cd.pedido = 22016545996