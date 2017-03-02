select 
	date(r.dt), 
	sum(if (r.idUsuario  > 0 , 1, 0 )) as respuestas_internas
from 
	helpdesk.hesk_replies r
left join 
	helpdesk.hesk_tickets t on t.id = r.replyto
left join 
	helpdesk.hesk_users u on  r.idUsuario = u.id

where u.id_department = 1
group by date(r.dt);

select 
	date(r.dt), 
  	 	sum(if (r.idUsuario  is null , 1, 0 )) as respuestas_externas
from 
	helpdesk.hesk_replies r
left join 
	helpdesk.hesk_tickets t on t.id = r.replyto
group by date(r.dt)

