
/**
 * Author:  Pascual Muñoz 
 * Created: 21-oct-2016
 */

set @user_expr = '%jesu%'; 

select *
from 
	helpdesk.hesk_users u 
	left join helpdesk.hesk_users_departments d on d.id = u.id_department
	where 
		lower(u.`name`)  like lower(@user_expr )
	    or lower( u.`user`)    like lower(@user_expr)
;
