SELECT line.Line_name AS Line, COUNT(ticket_vehicle.ticket_id) AS Ticket_count
FROM ticket_vehicle
INNER JOIN vehicle_journey ON ticket_vehicle.Vehicle_id = vehicle_journey.Vehicle_id
INNER JOIN journey_info ON vehicle_journey.journey_id = journey_info.Journey_id
INNER JOIN line ON journey_info.Line_id = line.Line_id
GROUP BY Line
ORDER BY Ticket_count DESC