-- --1
-- SELECT first_name, last_name, role
-- FROM Employee
-- WHERE role = 'Nurse' OR role = 'Doctor'
 

-- -- 2
-- SELECT drug_name, frequency, available_stock, first_name, last_name, address
-- FROM DrugStock ds
-- JOIN Patient p ON ds.pid = p.pid
-- WHERE available_stock = 0

-- -- 3
-- SELECT bill_id, amount, due_date, status
-- FROM PatientBilling
-- WHERE status = 'Unpaid'


-- -- 4
-- SELECT vl.date, vl.notes
-- FROM PatientVisitLog vl
-- JOIN Employee emp on vl.eid = emp.eid
-- JOIN Patient p on vl.pid = p.pid
-- WHERE emp.first_name = 'John'
-- AND p.first_name = 'Sarah'

-- -- 5
-- SELECT day_of_week, first_name, last_name
-- FROM WeeklySchedule ws
-- JOIN Employee emp ON ws.eid = emp.eid
-- WHERE ws.day_of_week = 'Wednsday'


-- -- 6
-- SELECT COUNT(eid) as employee_count
-- from Employee


-- -- 7
--         WITH CareCounts AS (
--     SELECT required_care, COUNT(event_id) AS frequency
--     FROM WeeklySchedule
--     GROUP BY required_care
-- )
-- SELECT required_care, frequency
-- FROM CareCounts
-- WHERE frequency = (
--     SELECT MAX(frequency) FROM CareCounts
-- );

-- -- 8
SELECT COUNT(DISTINCT(ws.pid)) AS patient_count
FROM WeeklySchedule ws
JOIN Employee e ON ws.eid = e.eid
WHERE e.first_name = 'John';
