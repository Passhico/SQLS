SELECT 
		art.id_articulo, art.ref_fabricante, art.nombre, art.nombre_google, art.slug, art.detalle, 
		art.precio, art.precio_compra, art.marca, art.ean, 
		(select seo.id from seo_element as seo where seo.type_index=art.id_familia and seo.seo_type_id = 2 ) as id_familia, 
		concat('articles/',floor(art.id_articulo/10000),'/',art.id_articulo,'/',(select nombre from api_articulos_imagenes aai where aai.id_articulo = art.id_articulo and aai.id_imagenes_tipo = 1 limit 1)) as imagen, 
		art.entrada,
		gast.gastos_envio, gast.stock AS disponibilidad, art.familia, 
		(select seo.id from seo_element as seo where seo.type_index=art.id_superpadre and seo.seo_type_id = 2 ) as id_superpadre, 
		GROUP_CONCAT(com.id_articulo SEPARATOR ',') AS bundle, fgt.id_gtaxonomy 
		FROM articulos AS art 
		INNER JOIN articulos_gastos_envio AS gast ON gast.id_articulo=art.id_articulo 
		LEFT JOIN articulos_compuestos AS com ON com.id_articulo_compuesto=art.id_articulo 
		LEFT JOIN familias_gtaxonomies AS fgt ON fgt.id_familia=art.id_familia 
		WHERE art.precio > 0 
		AND art.id_articulo NOT IN(2, 10003, 10004, 10005, 10006, 11000, 19000, 20000, 21004, 21010, 21017, 23001, 31044, 31045, 31046, 54958, 54959,
	55996, 55998, 63258, 65450, 63315, 63313, 59051) 
		AND gast.gastos_envio > 0 
		GROUP BY art.id_articulo 
		ORDER BY art.id_articulo DESC 
limit 1000