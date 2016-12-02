SELECT f.faq,count(f.faq)

FROM hesk_tickets_soporte h, hesk_tickets t, web.faqs_faqs_nuevos f

WHERE h.trackid=t.trackid and h.faq=f.id_faqs_faqs

AND date(t.dt) >= '2016-04-01'

GROUP BY f.faq

 

 