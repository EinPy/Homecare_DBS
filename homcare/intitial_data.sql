-- Patients
INSERT INTO Patient (pid, first_name, last_name, address, dob, sex, phone_number)
VALUES
(1, 'Ingrid', 'Larsen', 'Storgata 12, Oslo', '1991-03-22', 'Female', '48123456'),
(2, 'John', 'Haugen', 'Bryggen 5, Bergen', '1988-07-08', 'Male', '48234567'),
(3, 'Sarah', 'Berg', 'Elgveien 4, Tromsø', '2000-11-17', 'Female', '48345678');

-- Emergency Contacts
INSERT INTO EmergencyContact (eid, first_name, last_name, email, phone_number)
VALUES
(1, 'Kari', 'Larsen', 'kari.larsen@example.no', '47987654'),
(2, 'Jonas', 'Haugen', 'jonas.haugen@example.no', '47654321'),
(3, 'Sarah', 'Berg', 'torbjorn.berg@example.no', '47999888');

-- Relationships
INSERT INTO Relationship (eid, pid, relationship)
VALUES
(1, 1, 'Parent'),
(2, 2, 'Sibling'),
(3, 3, 'Parent');

-- Drug Stock
INSERT INTO DrugStock (pid, drug_name, frequency, available_stock)
VALUES
(1, 'Paracet', 2, 20),
(1, 'Tran', 1, 12),
(2, 'Ibux', 3, 30),
(2, 'Insulin', 2, 8),
(3, 'Antibiotika', 2, 15),
(3, 'Viagra', 1, 0);

-- Employees
INSERT INTO Employee (eid, first_name, last_name, address, email, role, manager_id)
VALUES
(101, 'Siv', 'Berg', 'Kirkeveien 21, Oslo', 'siv.berg@sykehus.no', 'Doctor', 103),
(102, 'Siv', 'Lie', 'Skogveien 9, Trondheim', 'haakon.lie@sykehus.no', 'Nurse', 103),
(103, 'Anne', 'Solberg', 'Fjordveien 3, Stavanger', 'anne.solberg@sykehus.no', 'Manager', NULL),
(104, 'John', 'Nygaard', 'Granliveien 8, Lillehammer', 'john.nygaard@sykehus.no', 'Nurse', 103);

-- Payroll
INSERT INTO Payroll (eid, fixed_rate, payroll_cycle, last_paid)
VALUES
(101, 980000.00, 'Monthly', '2025-04-01'),
(102, 520000.00, 'Bi-Weekly', '2025-04-04'),
(103, 1100000.00, 'Monthly', '2025-04-01'),
(104, 500000.00, 'Monthly', '2025-04-01');

-- Patient Billing
INSERT INTO PatientBilling (bill_id, amount, status, due_date, payment_date, pid)
VALUES
(1001, 1250.00, 'Paid', '2025-03-01', '2025-02-27', 1),
(1002, 2100.00, 'Pending', '2025-04-15', NULL, 2),
(1003, 1600.00, 'Unpaid', '2025-05-10', NULL, 3);

-- Visit Logs
INSERT INTO PatientVisitLog (pid, eid, date, notes)
VALUES
(1, 101, '2025-04-01', 'Rutinekontroll, alt ser bra ut'),
(2, 102, '2025-04-02', 'Oppfølging for medisinering'),
(3, 104, '2025-04-05', 'Sårskift, pasienten rapporterer redusert smerte');

-- Weekly Schedules
INSERT INTO WeeklySchedule (event_id, eid, pid, day_of_week, required_care)
VALUES
(1, 102, 1, 'Monday', 'M'), 
(2, 101, 2, 'Wednsday', 'F'),
(3, 104, 3, 'Friday', 'C'),
(4, 104, 1, 'Wednsday', 'M'),
(5, 104, 2, 'Thursday', 'H'),
(6, 102, 3, 'Monday', 'C');
