/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`127.0.0.1`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW elite_db.vilog (
   [time], 
   [systemname], 
   [stationname], 
   [eventtype], 
   [cargoaction], 
   [loccommodity], 
   [cargovolume], 
   [credits_transaction], 
   [credits_total], 
   [distance], 
   [notes])
AS 
   SELECT 
      l.time AS time, 
      s.systemname AS systemname, 
      st.stationname AS stationname, 
      e.eventtype AS eventtype, 
      c.cargoaction AS cargoaction, 
      co.loccommodity AS loccommodity, 
      l.cargovolume AS cargovolume, 
      l.credits_transaction AS credits_transaction, 
      l.credits_total AS credits_total, 
      l.distance AS distance, 
      l.notes AS notes
   FROM (((((elite_db.tblog  AS l 
      LEFT JOIN elite_db.tbeventtype  AS e 
      ON ((l.event_id = e.id))) 
      LEFT JOIN elite_db.tbcargoaction  AS c 
      ON ((l.cargoaction_id = c.id))) 
      LEFT JOIN elite_db.tbsystems  AS s 
      ON ((l.system_id = s.id))) 
      LEFT JOIN elite_db.tbstations  AS st 
      ON ((l.station_id = st.id))) 
      LEFT JOIN elite_db.tbcommodity  AS co 
      ON ((l.commodity_id = co.id)))
GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.vilog', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'VIEW', @level1name = N'vilog';

