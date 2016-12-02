/* 
 * Copyright (C) 2016 passhico
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
/**
 * Author:  Pascual Muñoz , basada en la consulta original de Bernardo Esteban. 
 * Created: 02-dic-2016
 */

(
     SELECT
    `pccom_returns_internal_obs`.`obsId` AS "obs_log_ID",
    `pccom_returns_internal_obs`.`returnId`,
    `pccom_returns_internal_obs`.`position`,
    `pccom_returns_internal_obs`.`dt`,
    `pccom_returns_internal_obs`.`text` AS "TEXTO",
    `pccom_returns_internal_obs`.`user`,
  NULL AS "TIPOID",
  NULL AS "SUBTIPOID",
    NULL AS "INFORMACION",
    NULL AS "STATUSID"
    FROM
    `web`.`pccom_returns_internal_obs`
)
UNION ALL
(
    SELECT
    `pccom_returns_log`.`logId` "obs_log_ID",
    `pccom_returns_log`.`returnId`,
    `pccom_returns_log`.`position`,
    `pccom_returns_log`.`dt`,
    `pccom_returns_log`.`actionText` AS "TEXTO",
    `pccom_returns_log`.`user`,
  `pccom_returns_log`.`typeId` AS "TIPOID",
  `pccom_returns_log`.`subtypeId` AS "SUBTIPOID",
    `pccom_returns_log`.`info` AS "INFORMACION",
    `pccom_returns_log`.`idStatus` AS "STATUSID"
    FROM
    `web`.`pccom_returns_log`
);


