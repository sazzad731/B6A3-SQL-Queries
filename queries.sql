-- Query 1: JOIN
SELECT booking_id, name AS customer_name, vehicle_name, start_date, end_date, booking_status AS status FROM bookings
INNER JOIN users USING(user_id)
INNER JOIN vehicles USING(vehicle_id)




-- Query 2: EXISTS
SELECT vehicle_id, vehicle_name AS name, vehicle_type AS type, model, registration_number, rental_price_per_day AS rental_price, availability_status as status FROM vehicles AS v
WHERE NOT EXISTS (
  SELECT *
  FROM bookings AS b
  WHERE b.vehicle_id = v.vehicle_id
)






-- Query 3: WHERE
SELECT vehicle_id, vehicle_name AS name, vehicle_type AS type, model, registration_number, rental_price_per_day AS rental_price, availability_status AS status FROM vehicles
WHERE availability_status = 'available' AND vehicle_type = 'car'





-- Query 4: GROUP BY and HAVING
SELECT vehicle_name, COUNT(*) AS total_bookings FROM bookings
JOIN vehicles USING(vehicle_id)
GROUP BY vehicle_name
HAVING COUNT(*) > 2