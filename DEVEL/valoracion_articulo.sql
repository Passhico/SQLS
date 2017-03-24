select c.id_articulo, round(avg(c.valoracion)/2)
from comentarios c
group by id_articulo
