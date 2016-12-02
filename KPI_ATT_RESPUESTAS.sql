select 
	date(r.dt), 
	sum(if (r.idUsuario  > 0 , 1, 0 )) as respuestas_internas, 
  	 	sum(if (r.idUsuario  is null , 1, 0 )) as respuestas_externas
from 
	helpdesk.hesk_replies r
left join 
	helpdesk.hesk_tickets t on t.id = r.replyto

group by date(r.dt)
