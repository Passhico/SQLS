set @ano = 2016;
set @mes = 5;


select pedido,
		 STR_TO_DATE(cd.enviado,'%d-%m-%Y') as fecha_enviado, 
		 date(cd.fecha_pago) as fecha_pagado, 
		 
datediff(STR_TO_DATE(cd.enviado,'%d-%m-%Y') , date(cd.fecha_pago)  )  as dias_en_salir 

from compras_datos cd 
	  left join compras_articulos ca on ca.id_compras_datos=cd.id_compras_datos
where 
		ca.id_producto = 31046
		and enviado <> 'no'
		and STR_TO_DATE(cd.enviado,'%d-%m-%Y') is not null 
		and  date(cd.fecha_pago) <> '0000-00-00' 
		and STR_TO_DATE(cd.enviado,'%d-%m-%Y') <> '0000-00-00'  

		and month(date(cd.fecha_pago)) = @mes
		and year(date(cd.fecha_pago)) = @ano
