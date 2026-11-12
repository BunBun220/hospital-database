USE hospital;

-- ============================================
-- HOSPITAL DATABASE - SAMPLE DATA
-- Insert order respects foreign key dependencies
-- ============================================

-- 1. DEPARTMENT (insert first without head, update later once Employee exists)
INSERT INTO Department (Dept_name, Head_of_Dept_id) VALUES
('Cardiology', NULL),
('Pharmacy', NULL),
('General Medicine', NULL),
('Orthopedics', NULL);

-- 2. EMPLOYEE (Dept_id 1=Cardiology, 2=Pharmacy, 3=General Medicine, 4=Orthopedics)
INSERT INTO Employee (Emp_name, Emp_gender, Emp_role, Emp_contact, Emp_joiningdate, Emp_Email, Emp_salary, Dept_id) VALUES
('Ahmed Khan', 'Male', 'Doctor', '0551234567', '2018-03-15', 'ahmed.khan@hospital.com', 22000, 1),
('Sara Ali', 'Female', 'Doctor', '0559876543', '2019-07-01', 'sara.ali@hospital.com', 21000, 3),
('Omar Nasser', 'Male', 'Doctor', '0556543210', '2020-01-10', 'omar.nasser@hospital.com', 20000, 4),
('Lina Fahad', 'Female', 'Nurse', '0557778888', '2021-05-20', 'lina.fahad@hospital.com', 8500, 1),
('Huda Saleh', 'Female', 'Nurse', '0553334444', '2020-11-11', 'huda.saleh@hospital.com', 8200, 3),
('Mohammed Yousef', 'Male', 'PharmacyStaff', '0552221111', '2019-09-01', 'm.yousef@hospital.com', 7000, 2),
('Fatima Zahra', 'Female', 'Receptionist', '0554445555', '2022-02-14', 'fatima.zahra@hospital.com', 5500, 3),
('Khalid Rashid', 'Male', 'Admin', '0556667777', '2017-06-01', 'khalid.rashid@hospital.com', 12000, 2);

-- Now update Department with the correct Head_of_Dept_id
UPDATE Department SET Head_of_Dept_id = 1 WHERE Dept_id = 1; -- Ahmed Khan heads Cardiology
UPDATE Department SET Head_of_Dept_id = 6 WHERE Dept_id = 2; -- Mohammed Yousef heads Pharmacy
UPDATE Department SET Head_of_Dept_id = 2 WHERE Dept_id = 3; -- Sara Ali heads General Medicine
UPDATE Department SET Head_of_Dept_id = 3 WHERE Dept_id = 4; -- Omar Nasser heads Orthopedics

-- 3. DOCTOR (subtype rows for Emp_id 1, 2, 3)
INSERT INTO Doctor (Emp_id, Specialization, Qualification, Consultation_fee) VALUES
(1, 'Cardiologist', 'MBBS, MD Cardiology', 300.00),
(2, 'General Physician', 'MBBS', 150.00),
(3, 'Orthopedic Surgeon', 'MBBS, MS Ortho', 350.00);

-- 4. NURSE (subtype rows for Emp_id 4, 5)
INSERT INTO Nurse (Emp_id, Shift, Ward_assigned) VALUES
(4, 'Morning', 'Cardiology Ward'),
(5, 'Night', 'General Ward');

-- 5. PHARMACY_STAFF_ASSIGNMENT (Emp_id 6)
INSERT INTO Pharmacy_staff_assignment (Emp_id, Designation) VALUES
(6, 'Pharmacist');

-- 6. PATIENT
INSERT INTO Patient (Patient_name, Patient_gender, Patient_age, Patient_dob, Patient_contact, Patient_bloodgroup, Patient_emergency_contact_name, Patient_emergency_contact_phone) VALUES
('Yousef Al-Harbi', 'Male', 34, '1992-04-12', '0501112222', 'O+', 'Nasser Al-Harbi', '0501113333'),
('Noura Saeed', 'Female', 28, '1998-01-25', '0502223333', 'A+', 'Saeed Al-Ghamdi', '0502224444'),
('Faisal Al-Otaibi', 'Male', 45, '1981-09-09', '0503334444', 'B+', 'Aisha Al-Otaibi', '0503335555'),
('Mariam Abdullah', 'Female', 60, '1966-06-30', '0504445555', 'AB+', 'Sami Abdullah', '0504446666'),
('Abdullah Al-Qahtani', 'Male', 5, '2021-03-03', '0505556666', 'O-', 'Mona Al-Qahtani', '0505557777');

-- 7. WARD
INSERT INTO Ward (Ward_type, Ward_status) VALUES
('General Ward', 'Available'),
('ICU', 'Occupied');

-- 8. APPOINTMENT
INSERT INTO Appointment (Appointment_Date, Patient_id, Emp_id, Appointment_status, Appointment_reason) VALUES
('2026-08-01 09:00:00', 1, 1, 'Completed', 'Chest pain'),
('2026-08-02 10:30:00', 2, 2, 'Completed', 'Routine checkup'),
('2026-08-03 11:00:00', 3, 3, 'Scheduled', 'Knee pain'),
('2026-08-04 09:30:00', 4, 1, 'Completed', 'Follow-up for hypertension'),
('2026-08-05 14:00:00', 5, 2, 'Completed', 'Fever and cough');

-- 9. MEDICAL_RECORDS (only for completed appointments: 1, 2, 4, 5)
INSERT INTO Medical_records (Appointment_id, Diagnosis, Notes, Date_recorded) VALUES
(1, 'Mild angina', 'Advised lifestyle changes and follow-up in 2 weeks', '2026-08-01 09:30:00'),
(2, 'Healthy - normal checkup', 'No abnormalities found', '2026-08-02 11:00:00'),
(4, 'Hypertension - Stage 1', 'Blood pressure 145/92, prescribed medication', '2026-08-04 10:00:00'),
(5, 'Viral fever', 'Rest and hydration advised', '2026-08-05 14:30:00');

-- 10. PRESCRIPTION (only for appointments where medicine was prescribed: 1, 4, 5)
INSERT INTO Prescription (Appointment_id, Emp_id, Date_issued) VALUES
(1, 1, '2026-08-01'),
(4, 1, '2026-08-04'),
(5, 2, '2026-08-05');

-- 11. MEDICINE
INSERT INTO Medicine (Medicine_name, Manufacturer, Price, Stock_qty, Expiry_date) VALUES
('Paracetamol 500mg', 'GSK', 5.00, 500, '2027-12-31'),
('Amoxicillin 250mg', 'Pfizer', 12.50, 300, '2027-06-30'),
('Atorvastatin 20mg', 'SPIMACO', 20.00, 150, '2027-09-30'),
('Losartan 50mg', 'Novartis', 15.00, 200, '2027-10-15'),
('Ibuprofen 400mg', 'Sanofi', 8.00, 400, '2027-08-20');

-- 12. PRESCRIPTION_DETAIL
INSERT INTO Prescription_detail (Prescription_id, Medicine_id, Dosage, Quantity, Duration_days) VALUES
(1, 3, '1 tablet daily at night', 30, 30),
(1, 1, '1 tablet as needed for pain', 10, 5),
(2, 4, '1 tablet every morning', 30, 30),
(3, 1, '1 tablet every 6 hours', 10, 5),
(3, 5, '1 tablet every 8 hours after food', 10, 5);

-- 13. ADMISSION (patient 4 admitted to ICU, patient 3 admitted to General Ward)
INSERT INTO Admission (Patient_id, Ward_id, Emp_id, Admission_date, Discharge_date) VALUES
(4, 2, 1, '2026-08-04 12:00:00', NULL),
(3, 1, 3, '2026-08-03 13:00:00', '2026-08-06 10:00:00');

-- 14. BILLING
INSERT INTO Billing (Patient_id, Admin_id, Appointment_id, Total_amount, Payment_status, Bill_date) VALUES
(1, NULL, 1, 150.00, 'Paid', '2026-08-01 10:00:00'),
(2, NULL, 2, 100.00, 'Paid', '2026-08-02 11:30:00'),
(3, 2, NULL, 800.00, 'Pending', '2026-08-06 11:00:00'),
(4, 1, NULL, 2500.00, 'Pending', '2026-08-05 09:00:00'),
(5, NULL, 5, 90.00, 'Paid', '2026-08-05 15:00:00');
