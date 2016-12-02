select r.created as dt_creacion_caso,
a.dt as dt_generada_asistente,
a.provincia,  
timediff(a.dt, r.created) as Lapso ,
t.name as tipo,
r.returnId as Numero_Caso, a.*
from pccom_returns r
left join asistente_recogidas a on r.returnId = a.id_caso
left join pccom_returns_types t on t.typeId=r.typeId
where
date(r.created) = SUBDATE(current_date, 1)
order by r.created;

select r.created as dt_creacion_caso,
a.dt as dt_generada_asistente,
a.provincia,  
timediff(a.dt, r.created) as Lapso ,
t.name as tipo,
r.returnId as Numero_Caso, a.*
from pccom_returns r
left join asistente_recogidas a on r.returnId = a.id_caso
left join pccom_returns_types t on t.typeId=r.typeId
where
date(r.created) = SUBDATE(current_date, 1)
and a.provincia in ( 'Ceuta' , 'Melilla')
order by r.created;
