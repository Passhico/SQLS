

SELECT 
count(*), 
    `transporte_seleccionado`, 
    if ( locate('-', enviado) = '3', STR_TO_DATE(enviado,'%d-%m-%Y'), STR_TO_DATE(enviado,'%Y-%m-%d')) as fecha 
    
FROM web.`compras_datos`
WHERE enviado <> 'no' and eliminado='n'
group by  if ( locate('-', enviado) = '3', STR_TO_DATE(enviado,'%d-%m-%Y'), STR_TO_DATE(enviado,'%Y-%m-%d')) , transporte_seleccionado