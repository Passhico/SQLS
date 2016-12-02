/*Definimos articulo*/
set @id_articulo = '37509';

/*Definimos precio y rangos*/
set @precio = 10.95; 
set @margen = 12;


/*Cargamos la familia a la que pertenece dicho artículo*/
select familia 
from web.articulos a 
where a.id_articulo = @id_articulo
into @familia;


select * 
from web.articulos a
where 
		a.familia = @familia
and	a.precio BETWEEN (@precio * 0.90)  and  (@precio * 1.10 )
limit 10