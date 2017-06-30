SELECT
    (@cnt := @cnt + 1) AS rowNumber,
    a.id_articulo
FROM articulos a  
  CROSS JOIN (SELECT @cnt := 0) AS dummy
WHERE a.activo = 's' 
and a.id_articulo not in (2, 10003, 10004, 10005, 10006, 11000, 19000, 20000, 21004, 21010, 21017, 23001, 31044, 31045, 31046, 54958, 54959,
			55996, 55998, 63258, 65450, 63315, 63313, 59051) 
ORDER BY a.id_articulo desc ;

