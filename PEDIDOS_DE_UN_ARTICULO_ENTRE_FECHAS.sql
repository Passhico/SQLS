SET @ia = '53015' ;/*57321 y 53015*/
SET @fecha_desde = '2016-04-01';
SET @fecha_hasta = '2016-04-08';


SELECT compras_datos.pedido , clientes.nombre , clientes.telefono_movil , clientes.telefono_fijo  , compras_datos.fecha , compras_datos.enviado, compras_datos.pago
FROM  compras_articulos 
LEFT JOIN compras_datos ON compras_articulos.id_compras_datos = compras_datos.id_compras_datos
LEFT JOIN clientes ON clientes.id_cliente = compras_datos.id_cliente
WHERE id_producto = @ia 
and compras_datos.fecha between @fecha_desde and @fecha_hasta
AND eliminado = 'n'
order by fecha
