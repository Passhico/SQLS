
select 
	s.ordernumber
from 
	pccom_logistic_orders_stickers s 
	inner join web.compras_datos d on s.orderNumber=d.pedido 
    inner join componentes.pccom_logistic_orders_to_print_statics p on s.orderNumber=p.orderNumber
where storehouse=4 and date_format(datetimepackage,'%Y-%m-%d')<>date_format(closedatetime,'%Y-%m-%d') and closedatetime is not null and enviado='no' and eliminado='n' and datetimepackage<timestamp(curdate()-1,'18:00:00') and p.`status`=1
order by datetimepackage