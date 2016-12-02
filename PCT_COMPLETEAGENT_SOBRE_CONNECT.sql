SET @v_agent = 'arturo.miro';
SET @v_fecha =  '2016-04-18';

/*TOTAL LLAMADAS ATENDIDAS*/
 SELECT count(*) 
FROM queue_log 
where agent = @v_agent
AND date(time) = @v_fecha
and `event` = 'CONNECT'
into @total_CONNECT;

/*TOTAL LLAMADAS COLGADAS*/
 SELECT count(*) 
FROM queue_log 
where agent = @v_agent
AND date(time) = @v_fecha
and `event` = 'COMPLETEAGENT'
into @total_COMPLETEAGENT;

select @total_CONNECT 										 as total_recibidas, 
		 @total_COMPLETEAGENT								 as total_colgadas,  
		 (@total_COMPLETEAGENT/@total_CONNECT)*100	 as pct_llamadas_finalizadas_por_operador;