select year(r.created) as 'anio', month(r.created) as mes_creacion ,count(*) , subtipo.name 
from web.pccom_returns r 
left join web.pccom_returns_subtypes subtipo on subtipo.subtypeId = r.subtypeId
where r.typeId = 3 and subtipo.name = 'TRANSPORTE' and year(r.created) = 2016
group by year(r.created), month(r.created), subtipo.name
order by anio desc , mes_creacion asc


