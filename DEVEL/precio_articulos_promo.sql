SELECT pade.id_articulo , 
	    pade.precio_nuevo
FROM promociones_articulos_dia_especial pade
WHERE pade.stock >= 1 
group by pade.id_articulo
/*
UNION
SELECT pa.id_articulo AS id_articulo_en_promocion
FROM promociones p
INNER JOIN promociones_articulos pa ON p.id_promocion = pa.id AND p.activo = 's'
;
*/

