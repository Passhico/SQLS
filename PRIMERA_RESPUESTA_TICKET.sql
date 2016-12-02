select u.user as "user_primera_respuesta" ,  t.id as id_ticket , COUNT(*) N_RESPUESTAS

from 
	`helpdesk`.`hesk_tickets` t 
	left join  `helpdesk`.`hesk_replies` r  on t.id = r.replyto 
	left join  `helpdesk`.`hesk_users` u on u.id = r.idUsuario

where
  r.respuestaPccomponentes = 's' and
  custom2 = '' and /*SOLO GENERADOS POR EL CLIENTE*/ 
  date(r.dt) = date( now() )
  

group by  t.trackid

order by r.dt desc


