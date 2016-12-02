/* 
 * Copyright (C) 2016 passhico
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
/**
 * Author:  passhico
 * Created: 02-dic-2016
 */

set @fecha_desde = '2016-12-01' ;	 /*Introduce aquí la fecha */
set @fecha_hasta = '2016-12-02' ;

set @mail = 'mvalffer@gmail.com'; 					 /*Mail para que saque los trackids si hace falta */
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
	