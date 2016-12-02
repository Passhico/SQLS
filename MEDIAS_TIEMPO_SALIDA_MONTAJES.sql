


select year( STR_TO_DATE(cd.enviado,'%d-%m-%Y') ) as año,
       month( STR_TO_DATE(cd.enviado,'%d-%m-%Y') ) as mes ,
		 ROUND (avg ( datediff(STR_TO_DATE(cd.enviado,'%d-%m-%Y') , date(cd.fecha_pago)  ) ) ,1) as media_dias_montajes_desde_pagado_hasta_salida
from compras_datos cd 
	  left join compras_articulos ca on ca.id_compras_datos=cd.id_compras_datos
where 
		ca.id_producto = 31046
		and enviado <> 'no'
		and STR_TO_DATE(cd.enviado,'%d-%m-%Y') is not null and  date(cd.fecha_pago) <> '0000-00-00' 
 		and datediff(STR_TO_DATE(cd.enviado,'%d-%m-%Y') , date(cd.fecha)  ) < 30 
group by 
		year( STR_TO_DATE(cd.enviado,'%d-%m-%Y') ) , month( STR_TO_DATE(cd.enviado,'%d-%m-%Y') )