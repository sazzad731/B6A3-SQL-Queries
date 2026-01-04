# 🚗 Vehicle Rental System – Query Explanations & Solutions
This section explains all SQL queries included in the `queries.sql` file.

---

### Query 1: Retrieve Booking Information (JOIN)

**Requirement:** Retrieve booking details along with the customer name and vehicle name.

**Concepts Used:** `INNER JOIN`

```postgresql
SELECT
  booking_id,
  name AS customer_name,
  vehicle_name,
  start_date,
  end_date,
  booking_status AS status
FROM bookings
INNER JOIN users USING(user_id)
INNER JOIN vehicles USING(vehicle_id);
```

**Explanation:** This query joins the `bookings`, `users`, and `vehicles` tables using foreign keys to display complete booking information including customer and vehicle details.

---

### Query 2: Find Vehicles That Have Never Been Booked (EXISTS)

**Requirement:** Find all vehicles that do not appear in any booking records.

**Concepts Used:** `NOT EXISTS`

```postgresql
SELECT
  vehicle_id,
  vehicle_name AS name,
  vehicle_type AS type,
  model,
  registration_number,
  rental_price_per_day AS rental_price,
  availability_status AS status
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
);
```

**Explanation:** The `NOT EXISTS` clause checks for vehicles that have no matching records in the `bookings` table, ensuring only never-booked vehicles are returned.

---



### Query 3: Retrieve Available Vehicles by Type (WHERE)

**Requirement:** Retrieve all available vehicles of a specific type (e.g., cars).

**Concepts Used:** `SELECT`, `WHERE`

```postgresql
SELECT
  vehicle_id,
  vehicle_name AS name,
  vehicle_type AS type,
  model,
  registration_number,
  rental_price_per_day AS rental_price,
  availability_status AS status
FROM vehicles
WHERE availability_status = 'available'
AND vehicle_type = 'car';
```

**Explanation:** This query filters vehicles based on availability status and vehicle type using the `WHERE` clause.


---



### Query 4: Vehicles With More Than 2 Bookings (GROUP BY & HAVING)

**Requirement:** Find vehicles that have been booked more than two times.

**Concepts Used:** `GROUP BY`, `HAVING`, `COUNT`

```postgresql
SELECT
  vehicle_name,
  COUNT(*) AS total_bookings
FROM bookings
JOIN vehicles USING(vehicle_id)
GROUP BY vehicle_name
HAVING COUNT(*) > 2;
```

**Explanation:** The query groups booking records by vehicle and uses the `HAVING` clause to filter vehicles with more than two bookings.
