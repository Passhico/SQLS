select date(time) as fecha , COUNT(*) as num, 'I_LLAMADA_ENTRANTE' as tipo
from asterisk.queue_log ql
where event='CONNECT'
GROUP BY DATE(time)
