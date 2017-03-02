/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Pascual Muñoz 
 * Created: 21-oct-2016
 */

set @fecha_desde =  '2016-10-01';

select *
from 

	(select 
			 r.id  as 'id', 
			 '1' as PRIMERA_RESPUESTA

		   from 
			 `helpdesk`.`hesk_tickets` t 
			 left join  `helpdesk`.`hesk_replies` r  on t.id = r.replyto 
			 left join  `helpdesk`.`hesk_users` u on u.id = r.idUsuario
			 left join	 `helpdesk`.`hesk_categories` cat on cat.id=t.category

		   where
			 r.respuestaPccomponentes = 's' and
			 custom2 = '' AND /*SOLO GENERADOS POR EL CLIENTE*/ 
			 /*      date(r.dt) = date( now() ) */
			 date(r.dt) > @fecha_desde
			 group by  t.trackid, date(r.dt)

			 order by r.dt desc
		)  ri
	left  join helpdesk.hesk_replies r on r.id = ri.id
where 
	date(r.dt) > @fecha_desde
