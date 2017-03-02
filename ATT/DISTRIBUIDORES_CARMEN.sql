SELECT

provincia , tarifa , id_cliente , nombre ,telefono , email, round( SUM(importe_total) ,2) , concat( 'http://admin.pccomponentes.com/quovadis/clientes.php?codigoxgest=' , id_cliente) as url
FROM
compras_datos
WHERE

tarifa=2 and
enviado<>'no' AND
provincia not in ('Baleares' , 'Las Palmas De Gran Canaria', 'Tenerife') and
fecha>='2015-01-01' AND fecha<'2016-01-01' AND

id_cliente IN

(
SELECT DISTINCT(id_cliente)
FROM
compras_datos
WHERE
enviado<>'no' AND
fecha>='2015-01-01' AND fecha<'2016-01-01' AND

tarifa=2

)
GROUP BY

id_cliente 
