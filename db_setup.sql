DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS EmergencyContact;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS VisitLog;
DROP TABLE IF EXISTS Payroll;
DROP TABLE IF EXISTS PatientWeeklyPlan;
DROP TABLE IF EXISTS DrugStock;
DROP TABLE IF EXISTS PatientDrugPlan;
DROP TABLE IF EXISTS PatientBilling;


-- Create Patients table
CREATE TABLE Patients (
    pid INTEGER PRIMARY KEY, 
    first_name VARCHAR(30), 
    last_name VARCHAR(30),
    address VARCHAR(100),
    birth_date DATE,
    sex BIT,
    phone_number VARCHAR(12),
    primary_caretaker INTEGER,
    FOREIGN KEY (primary_caretaker) REFERENCES Employees(eid)
);

-- Create EmergencyContact table
CREATE TABLE EmergencyContact (
    emergency_id INTEGER PRIMARY KEY, -- Unique ID for each emergency contact
    pid INTEGER, -- References the patient
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    address VARCHAR(100),
    email VARCHAR(50),
    relationship VARCHAR(100), -- Relationship to the patient
    phone_number VARCHAR(12),
    FOREIGN KEY (pid) REFERENCES Patients(pid) -- Forcing the pid to be a link to an existing patient
);


-- Create Employees table
CREATE TABLE Employees (
    eid INTEGER PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone_number VARCHAR(12),
    email VARCHAR(50),
    role VARCHAR(50),
    manager_id INTEGER,
    FOREIGN KEY (manager_id) REFERENCES Employees(eid) --forcing the manger key to be an existing manager, this means that the managers have to added first. 
);

-- Create Visit Log table
CREATE TABLE VisitLog (
    pid INTEGER,
    eid INTEGER,
    visit_datetime DATETIME,
    notes TEXT,
    PRIMARY KEY (pid, eid, visit_datetime),
    FOREIGN KEY (pid) REFERENCES Patients(pid),
    FOREIGN KEY (eid) REFERENCES Employees(eid)
);

-- Create Payroll table
CREATE TABLE Payroll (
    eid INTEGER PRIMARY KEY,
    fixed_rate DECIMAL(10,2),
    payroll_cycle VARCHAR(20),
    last_paid DATE,
    FOREIGN KEY (eid) REFERENCES Employees(eid)
);

-- Create Patient Weekly Plan table
CREATE TABLE PatientWeeklyPlan (
    pid INTEGER,
    day_of_week VARCHAR(10),
    required_care TEXT,
    eid INTEGER,
    PRIMARY KEY (pid, day_of_week),
    FOREIGN KEY (pid) REFERENCES Patients(pid),
    FOREIGN KEY (eid) REFERENCES Employees(eid)
);

-- Create Drug Stock table
CREATE TABLE DrugStock (
    drug_id INTEGER PRIMARY KEY,
    drug_name VARCHAR(50),
    weekly_drug_quantity INTEGER,
    current_stock INTEGER
);

-- Create Patient Drug Plan table
CREATE TABLE PatientDrugPlan (
    pid INTEGER,
    day_of_week VARCHAR(10),
    drug_id INTEGER,
    frequency VARCHAR(20),
    PRIMARY KEY (pid, day_of_week, drug_id),
    FOREIGN KEY (pid) REFERENCES Patients(pid),
    FOREIGN KEY (drug_id) REFERENCES DrugStock(drug_id)
);

-- Create Patient Billing table
CREATE TABLE PatientBilling (
    pid INTEGER,
    bill_id INTEGER PRIMARY KEY,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    due_date DATE,
    payment_date DATE,
    FOREIGN KEY (pid) REFERENCES Patients(pid)
);

-- Insert sample data
INSERT INTO Patients VALUES (1, 'John', 'Doe', '123 Main St', '1985-06-15', 1, '1234567890', 101);
INSERT INTO EmergencyContact VALUES (1, 'Jane', 'Doe', '456 Elm St', 'jane.doe@email.com', 'Sister', '9876543210');
INSERT INTO Employees VALUES (101, 'Alice', 'Brown', 'Nursing', '1112223333', 'alice.brown@email.com', 'Nurse', NULL);
INSERT INTO VisitLog VALUES (1, 101, '2025-03-15 10:00:00', 'Routine checkup');
INSERT INTO Payroll VALUES (101, 5000.00, 'Monthly', '2025-02-28');
INSERT INTO PatientWeeklyPlan VALUES (1, 'Monday', 'Physical Therapy', 101);
INSERT INTO DrugStock VALUES (1, 'Aspirin', 20, 100);
INSERT INTO PatientDrugPlan VALUES (1, 'Monday', 1, 'Twice daily');
INSERT INTO PatientBilling VALUES (1, 1001, 200.00, 'Pending', '2025-03-30', NULL);

