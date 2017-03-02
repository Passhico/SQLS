
/**
 * Author:  Pascual Muñoz 
 * Created: 21-oct-2016
 */

set @user_expr = '%%'; 

select u.id, u.`user`
from 
	helpdesk.hesk_users u 
	left join helpdesk.hesk_users_departments d on d.id = u.id_department
	where 

		 email like '%.ext%'
;
