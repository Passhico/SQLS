set @dia = '2016-12-14';

select r.typeId, r.returnId, r.created, r.reference,r.firstReference, r.productId,
a.dt as fechaRecogida,a.id_recogida,a.id_caso,a.cp,a.transporte, a.nRecogida, a.user,a.recepcionada,
ac.dt,ac.email_cliente, ac.pedido, ac.aceptado,ac.transporte,ac.recogida
from pccom_returns r
left join asistente_recogidas a on r.returnId = a.id_caso
left join asistente_casos ac on r.returnId = ac.id_caso
left join pccom_returns_address d on r.returnId = d.returnId
left join clientes_tarifas c on r.clientId = c.id_cliente
where date(r.created) = @dia
and r.typeId=1
and r.subtypeId=0
and r.shop=0
and d.state not in('%Ceuta%','%Melilla%')
and c.id_cliente is null
and a.nRecogida is null; 