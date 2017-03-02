
select current_date as hoy , count(*) as total
from hesk_replies r 
left join (hesk_users_departments d, hesk_users u) on ( u.id = r.idUsuario and d.id = u.id_department )
where date(dt) = current_date and id_department = 1
and respuestaPccomponentes = 's' 
;
/***************************************/


select u.name, count(*), current_date
from hesk_replies r 
left join (hesk_users_departments d, hesk_users u) on ( u.id = r.idUsuario and d.id = u.id_department )
where date(dt) = current_date and id_department = 1
and respuestaPccomponentes = 's' 
group by u.name
;





