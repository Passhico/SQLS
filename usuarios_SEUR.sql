select user from hesk_users 
inner join (hesk_users_departments) 
on (hesk_users.id_department = hesk_users_departments.id)
where id_department = 11;
