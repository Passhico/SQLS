
select *
from hesk_replies left join (hesk_users_departments, hesk_users)
on ( hesk_users.id = hesk_replies.idUsuario and hesk_users_departments.id = hesk_users.id_department )
where date(dt) = '2016-04-19' and id_department = 1
and respuestaPccomponentes = 's' ; 