
/**
 * Author:  Pascual Muñoz 
 * Created: 21-oct-2016
 */

set @user_expr = '%pascu%'; 

select *
from 
	helpdesk.hesk_users u 
	left join helpdesk.hesk_users_departments d on d.id = u.id_department
	where 
		lower(u.`name`)  like @user_expr
	    or lower( u.`user`)    like @user_expr
;
