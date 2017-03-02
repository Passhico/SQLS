SET @v_agent = 'arturo.miro';
SET @v_fecha =  '2016-04-18';


SELECT count(*) 
FROM queue_log 
where agent = @v_agent
AND date(time) = @v_fecha
and `event` = 'CONNECT'
into @total_CONNECT;


SELECT
    @total_CONNECT , 
	 sum( if(vscall2me.outcod in ( 'KO3', 'K04', 'OK'), 1,0) ) as valoradas,
	 sum( if(vscall2me.outcod in ( 'KO3', 'K04', 'OK'), 1,0) ) /  @total_CONNECT AS pct_valoradas_sobre_totales_recibidas 
FROM
    queue_log
        RIGHT JOIN
    vscall2me ON BINARY queue_log.callid = BINARY vscall2me.callid
WHERE
    DATE(queue_log.time) = @v_fecha
        AND agent = @v_agent
        AND EVENT = 'CONNECT'
ORDER BY queue_log.time DESC; 

