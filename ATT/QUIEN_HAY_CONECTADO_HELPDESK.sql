select count(*), d.department/* user , d.department */
from hesk_active_sessions s 
left join hesk_users u on u.id=s.idUsuario
left join hesk_users_departments d on u.id_department=d.id
group by d.department;

select  user , d.department 
from hesk_active_sessions s 
left join hesk_users u on u.id=s.idUsuario
left join hesk_users_departments d on u.id_department=d.id
