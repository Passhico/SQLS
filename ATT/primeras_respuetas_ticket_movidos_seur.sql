SELECT DISTINCT id_ticket, fecha AS dt_movido
FROM hesk_tickets_track htt
WHERE id_categ = 19
;
/*primeras respuestas a ticket movidos a SEUR*/
SELECT replyto as id_ticket, MIN(r.dt) as dt_primera_respuesta, idUsuario
FROM hesk_replies AS r
INNER JOIN (hesk_tickets) ON (r.replyto = hesk_tickets.id)
WHERE r.replyto IN (/*solo respuestas a los tickets movidos a SEUR */
							SELECT id_ticket
							FROM hesk_tickets_track htt
							WHERE id_categ = 19)
AND idUsuario in 
GROUP BY replyto;

