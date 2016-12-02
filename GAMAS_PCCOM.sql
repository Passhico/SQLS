
	select 
		pccom.id_articulo,
		'MEDIA_ALTA' as gama,  
		nombre_pccom 
	from 
		web.grupos_filtros_articulos fa
	left join 
		web.grupos_filtros gf on gf.id_filtro=fa.id_filtro
	left join  
		web.articulos_pccom pccom on pccom.id_articulo=fa.id_articulo
	where 
		pccom.nombre_pccom like '%Gaming%' 
		or pccom.nombre_pccom like '%work%'
union
	select 
		pccom.id_articulo,
		'MEDIA' as gama,  
		nombre_pccom 
	from 
		web.grupos_filtros_articulos fa
	left join 
		web.grupos_filtros gf on gf.id_filtro=fa.id_filtro
	left join  
		web.articulos_pccom pccom on pccom.id_articulo=fa.id_articulo
	where 
		pccom.nombre_pccom like '%Basic%' 
		or pccom.nombre_pccom like '%low%'
union
	select 
		pccom.id_articulo,
		'Raspberry' as gama,  
		nombre_pccom 
	from 
		web.grupos_filtros_articulos fa
	left join 
		web.grupos_filtros gf on gf.id_filtro=fa.id_filtro
	left join  
		web.articulos_pccom pccom on pccom.id_articulo=fa.id_articulo
	where 
		pccom.nombre_pccom like '%Raspberry%' 
union
	select 
		pccom.id_articulo,
		'msi-cubit' as gama,  
		nombre_pccom 
	from 
		web.grupos_filtros_articulos fa
	left join 
		web.grupos_filtros gf on gf.id_filtro=fa.id_filtro
	left join  
		web.articulos_pccom pccom on pccom.id_articulo=fa.id_articulo
	where 
		pccom.nombre_pccom like '%msi%' 


