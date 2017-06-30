select count(*), avg(c.valoracion), round(avg(c.valoracion)/2, 1)
from comentarios c
inner join articulos a on a.id_articulo=c.id_articulo and a.activo = 's'
group by c.id_articulo