# Query Anthi tickets
SELECT First_name, Last_name, passenger_ticket.ticket_id, purchase_datetime
FROM passenger
RIGHT JOIN passenger_ticket ON passenger.passenger_id = passenger_ticket.passenger_id
WHERE First_name = 'Anthi'