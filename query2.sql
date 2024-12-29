# line - stop
SELECT line_name AS Line, stop_info.stop_name as Stop
FROM line
INNER JOIN line_stops ON line.line_id = line_stops.line_id
INNER JOIN stop_info ON line_stops.stop_id = stop_info.stop_id