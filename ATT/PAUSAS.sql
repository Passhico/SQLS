set @fecha='2016-06-02';
set @agent='%';

select
	* ,
	  if( min(time)=time and event='UNPAUSE' ,'minimo','nominimo'),
	  sum(    timestampdiff( MINUTE , (select max(time) from queue_log where time < q.time and agent = q.agent and event in ('PAUSE','UNPAUSE') and date(time) = @fecha) , q.time )  )as sumatorio ,
	 (select max(time) from queue_log where time < q.time and agent = q.agent and event in ('PAUSE','UNPAUSE') ) as last_time
from
	queue_log q
where
	date(q.time) = @fecha
		and q.`event` in ('PAUSE','UNPAUSE')
	   AND agent like @agent	
group by event, agent
order by
	agent,time
