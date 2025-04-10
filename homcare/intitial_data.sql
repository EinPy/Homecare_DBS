-- Patients
INSERT INTO Patient (pid, first_name, last_name, address, dob, sex, phone_number)
VALUES
(1, 'Ingrid', 'Larsen', 'Storgata 12, Oslo', '1991-03-22', 'Female', '48123456'),
(2, 'Mats', 'Haugen', 'Bryggen 5, Bergen', '1988-07-08', 'Male', '48234567');

-- Emergency Contacts
INSERT INTO EmergencyContact (eid, first_name, last_name, email, relationship, phone_number, pid)
VALUES
(1, 'Kari', 'Larsen', 'kari.larsen@example.no', 'Parent', '47987654', 1),
(2, 'Jonas', 'Haugen', 'jonas.haugen@example.no', 'Sibling', '47654321', 2);

-- Drug Stock (PatientDrugPlan-style)
INSERT INTO DrugStock (pid, drug_name, frequency, available_stock)
VALUES
(1, 'Paracet', 2, 20),
(1, 'Tran', 1, 12),
(2, 'Ibux', 3, 30),
(2, 'Insulin', 2, 8);

-- Employees
INSERT INTO Employee (eid, first_name, last_name, address, email, role, manager_id)
VALUES
(101, 'Dr. Siv', 'Berg', 'Kirkeveien 21, Oslo', 'siv.berg@sykehus.no', 'Doctor', NULL),
(102, 'Håkon', 'Lie', 'Skogveien 9, Trondheim', 'haakon.lie@sykehus.no', 'Nurse', 101),
(103, 'Anne', 'Solberg', 'Fjordveien 3, Stavanger', 'anne.solberg@sykehus.no', 'Manager', NULL);

-- Payroll
INSERT INTO Payroll (eid, fixed_rate, payroll_cycle, last_paid)
VALUES
(101, 980000.00, 'Monthly', '2025-04-01'),
(102, 520000.00, 'Bi-Weekly', '2025-04-04'),
(103, 1100000.00, 'Monthly', '2025-04-01');

-- Patient Billing
INSERT INTO PatientBilling (bill_id, amount, status, due_date, payment_date, pid)
VALUES
(1001, 1250.00, 'Paid', '2025-03-01', '2025-02-27', 1),
(1002, 2100.00, 'Pending', '2025-04-15', NULL, 2);

-- Visit Logs
INSERT INTO PatientVisitLog (pid, eid, date, notes)
VALUES
(1, 101, '2025-04-01', 'Rutinekontroll, alt ser bra ut'),
(2, 102, '2025-04-02', 'Oppfølging for medisinering');

-- Weekly Schedules
INSERT INTO WeeklySchedule (event_id, eid, pid, day_of_week, required_care)
VALUES
(1, 102, 1, 'Monday', 'M'), 
(2, 101, 2, 'Wednsday', 'F');
