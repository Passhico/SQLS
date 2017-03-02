SET @v_agent = 'arturo.miro';
SET @v_fecha =  '2016-04-18';


SELECT
    count(*) as total,
	 sum( if(vscall2me.outcod in ( 'KO3', 'K04', 'OK'), 1,0) ) as valoradas,
	 sum( if(vscall2me.outcod in ( 'KO3', 'K04', 'OK'), 1,0) ) /  count(*) AS pct_valoradas_sobre_las_que_cuelga
	 
FROM
    queue_log
        RIGHT JOIN
    vscall2me ON BINARY queue_log.callid = BINARY vscall2me.callid
WHERE
    DATE(queue_log.time) = @v_fecha
        AND agent = @v_agent
        AND EVENT = 'CONNECT'
ORDER BY queue_log.time DESC; 

