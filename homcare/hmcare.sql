DROP TABLE IF EXISTS Payroll;
DROP TABLE IF EXISTS WeeklySchedule;
DROP TABLE IF EXISTS PatientVisitLog;
DROP TABLE IF EXISTS PatientDrugPlan;
DROP TABLE IF EXISTS PatientBilling;
DROP TABLE IF EXISTS EmergencyContact;
DROP TABLE IF EXISTS DrugStock;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Patient;


CREATE TABLE Patient (
    pid INTEGER PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    address VARCHAR(100),
    dob DATE,
    sex VARCHAR(10) CHECK (sex IN ('Female', 'Male', 'Others')),
    phone_number VARCHAR(15),
    eid INTEGER,
    FOREIGN KEY (eid) REFERENCES Employee(eid)
);

CREATE TABLE EmergencyContact (
    eid INTEGER PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE Relationship (
    eid INTEGER,
    pid INTEGER,
    relationship VARCHAR(10) CHECK (relationship IN ('Parent', 'Sibling', 'Spouse', 'Child', 'Friend', 'Doctor', 'Others')),
    PRIMARY KEY (eid, pid),
    FOREIGN KEY (eid) REFERENCES EmergencyContact(eid),
    FOREIGN KEY (pid) REFERENCES Patient(pid)
);


CREATE TABLE DrugStock (
    pid INTEGER,
    drug_name VARCHAR(60),
    frequency INTEGER CHECK (frequency >= 1),
    available_stock INTEGER CHECK (available_stock >= 0),
    PRIMARY KEY (pid, drug_name),
    FOREIGN KEY (pid) REFERENCES Patient(pid)
);



CREATE TABLE PatientBilling (
    bill_id INTEGER PRIMARY KEY,
    amount FLOAT CHECK (amount >= 0),
    status VARCHAR(10) CHECK (status IN ('Paid', 'Pending', 'Unpaid')),
    due_date DATE,
    payment_date DATE,
    pid INTEGER,
    FOREIGN KEY (pid) REFERENCES Patient(pid)
);

CREATE TABLE Employee (
    eid INTEGER PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    address VARCHAR(100),
    email VARCHAR(50),
    role VARCHAR(20) CHECK (role IN ('Nurse', 'Doctor', 'Unskilled Worker', 'Manager')),
    manager_id INTEGER,
    FOREIGN KEY (manager_id) REFERENCES Employee(eid)
);

CREATE TABLE Payroll (
    eid INTEGER PRIMARY KEY,
    fixed_rate FLOAT CHECK (fixed_rate >= 0),
    payroll_cycle VARCHAR(10) CHECK (payroll_cycle IN ('Weekly', 'Bi-Weekly', 'Monthly')),
    last_paid DATE CHECK (last_paid <= CURRENT_DATE),
    FOREIGN KEY (eid) REFERENCES Employee(eid)
);

CREATE TABLE PatientVisitLog (
    pid INTEGER,
    eid INTEGER,
    date DATE CHECK (date <= CURRENT_DATE),
    notes VARCHAR(200),
    PRIMARY KEY (pid, eid, date),
    FOREIGN KEY (pid) REFERENCES Patient(pid),
    FOREIGN KEY (eid) REFERENCES Employee(eid)
);

CREATE TABLE WeeklySchedule (
    event_id INTEGER PRIMARY KEY,
    eid INTEGER,
    pid INTEGER,
    day_of_week VARCHAR(10) CHECK (day_of_week IN ('Monday', 'Tuesday', 'Wednsday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    required_care VARCHAR(1) CHECK (required_care IN ('B', 'H', 'M', 'C', 'F')),
    FOREIGN KEY (eid) REFERENCES Employee(eid),
    FOREIGN KEY (pid) REFERENCES Patient(pid)
);
