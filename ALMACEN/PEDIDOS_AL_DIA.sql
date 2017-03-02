

SELECT 
count(*), 
    if ( locate('-', enviado) = '3', STR_TO_DATE(enviado,'%d-%m-%Y'), STR_TO_DATE(enviado,'%Y-%m-%d')) as fecha 
    
FROM web.`compras_datos`
WHERE enviado <> 'no' and eliminado='n' and year(fecha) >= 2016 
group by  if ( locate('-', enviado) = '3', STR_TO_DATE(enviado,'%d-%m-%Y'), STR_TO_DATE(enviado,'%Y-%m-%d')) 