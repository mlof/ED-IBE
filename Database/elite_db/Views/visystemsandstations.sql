/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`127.0.0.1`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW elite_db.visystemsandstations (
   [SystemID], 
   [SystemName], 
   [StationID], 
   [StationName])
AS 
   SELECT sy.id AS SystemID, sy.systemname AS SystemName, s.id AS StationID, s.stationname AS StationName
   FROM (elite_db.tbstations  AS s 
      CROSS JOIN elite_db.tbsystems  AS sy)
   WHERE (s.system_id = sy.id)
GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.visystemsandstations', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'VIEW', @level1name = N'visystemsandstations';

