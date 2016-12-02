
SELECT 
	IF(SUBSTR(cd.pedido,1)<4 OR (ci.trackid IS NOT NULL AND ci.trackid!='')
		,ci.trackid
		,(
			SELECT trackid
			FROM pccom_returns
			WHERE returnId = REPLACE(cd.observaciones,'RMA - ',''))
		 ) 
	AS trackid,
  cd.observaciones,
  ci.id_compras_datos,
  ci.fecha,
  ci.id_articulo,
  ci.abierta,
  ci.hora,
  ci.notificado,
  ci.urgencia,
  cd.nombre,
  cd.pedido,
  cd.importe_total,
  cd.recargo,
  cd.gastos_envio,
  ci.quien
FROM 
	web.`compras_incidencias` ci
LEFT JOIN  
	web.`compras_datos` cd on ci.id_compras_datos = cd.id_compras_datos
WHERE
	 cd.eliminado='n'
GROUP BY 
	ci.id_compras_datos
ORDER BY 
	ci.id_compras_incidencias ASC, urgencia DESC,cd.id_compras_datos ASC