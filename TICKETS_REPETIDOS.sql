set @fecha_desde = '2016-09-01' ;	 /*Introduce aquí la fecha */
set @fecha_hasta = '2016-09-02' ;

set @mail = 'maria@goldenrace.com'; 					 /*Mail para que saque los trackids si hace falta */
set @repeticiones = 3; 			 /*Numero de tickets repetidos*/


select count(*),t.email,  concat('http://admin.pccomponentes.com/quovadis/busca_clientes.php?param=', email )
from 
	helpdesk.hesk_tickets t 
	left join helpdesk.hesk_categories_attcl c on t.category = c.id
where 
	date(dt) between @fecha_desde and @fecha_hasta
	and ip not like '127.0.0.1'
	and status = 1
	and t.email not like 'noreply@pccomponentes.com'
group by email
having count(*) >= @repeticiones
order by count(*)

;
select CONCAT('http://admin.pccomponentes.com/helpdesk/admin_ticket.php?track=',  t.trackid) as track
from 
	helpdesk.hesk_tickets t 
where
	t.email like @mail
	