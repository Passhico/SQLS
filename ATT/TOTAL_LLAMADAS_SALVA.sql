SELECT
    SUM(if(queue_log.event = 'ENTERQUEUE',1,0)) as Inbound,
    CONCAT(SUM(if(queue_log.event = 'CONNECT',1,0))*100/(SUM(if(queue_log.event = 'ENTERQUEUE',1,0))), ' %') as Atended,
    CONCAT(SUM(if(queue_log.event = 'COMPLETEAGENT',1,0))*100/(SUM(if(queue_log.event = 'ENTERQUEUE',1,0))), ' %') as CompletedByAgents,
    CONCAT(SUM(if(queue_log.event = 'COMPLETECALLER',1,0))*100/(SUM(if(queue_log.event = 'ENTERQUEUE',1,0))), ' %') as CompletedByCallers,
    CONCAT(SUM(if(queue_log.event = 'RINGNOANSWER',1,0))*100/(SUM(if(queue_log.event = 'ENTERQUEUE',1,0))), ' %') as NoAnswered,
    CONCAT(SUM(if(queue_log.event = 'ABANDON',1,0))*100/(SUM(if(queue_log.event = 'ENTERQUEUE',1,0))), ' %') as Abandoned,
    CONCAT(SUM(if(queue_log.event = 'EXITEMPTY',1,0))*100/(SUM(if(queue_log.event = 'ENTERQUEUE',1,0))), ' %') as Exited
FROM
    asterisk.queue_log
WHERE
    date(time) = (CURRENT_DATE() - interval 1 day)