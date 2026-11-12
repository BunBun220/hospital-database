-- Hospital Management Database: demo queries
-- Run 01_create_tables.sql and 02_sample_data.sql first.

USE hospital;

-- 1. Show all patients
SELECT * FROM Patient;

-- 2. List doctors with their specialization and fee
SELECT Employee.Emp_name, Doctor.Specialization, Doctor.Consultation_fee
FROM Doctor
JOIN Employee ON Doctor.Emp_id = Employee.Emp_id;

-- 3. Which patient saw which doctor, when, and why
SELECT Patient.Patient_name,
       Employee.Emp_name AS Doctor_name,
       Appointment.Appointment_Date,
       Appointment.Appointment_reason
FROM Appointment
JOIN Patient ON Appointment.Patient_id = Patient.Patient_id
JOIN Employee ON Appointment.Emp_id = Employee.Emp_id
ORDER BY Appointment.Appointment_Date;

-- 4. Bills that are still pending
SELECT Bill_id, Patient_id, Total_amount, Bill_date
FROM Billing
WHERE Payment_status = 'Pending';

-- 5. Total amount billed per patient
SELECT Patient.Patient_name, SUM(Billing.Total_amount) AS Total_billed
FROM Billing
JOIN Patient ON Billing.Patient_id = Patient.Patient_id
GROUP BY Patient.Patient_name
ORDER BY Total_billed DESC;

-- 6. Medicines prescribed to each patient, with dosage
SELECT Patient.Patient_name,
       Medicine.Medicine_name,
       Prescription_detail.Dosage,
       Prescription_detail.Duration_days
FROM Prescription_detail
JOIN Prescription ON Prescription_detail.Prescription_id = Prescription.Prescription_id
JOIN Appointment ON Prescription.Appointment_id = Appointment.Appointment_id
JOIN Patient ON Appointment.Patient_id = Patient.Patient_id
JOIN Medicine ON Prescription_detail.Medicine_id = Medicine.Medicine_id;

-- 7. Number of employees in each department
SELECT Department.Dept_name, COUNT(Employee.Emp_id) AS Employee_count
FROM Department
LEFT JOIN Employee ON Employee.Dept_id = Department.Dept_id
GROUP BY Department.Dept_name;

-- 8. Patients currently admitted (not yet discharged), with ward type
SELECT Patient.Patient_name, Ward.Ward_type, Admission.Admission_date
FROM Admission
JOIN Patient ON Admission.Patient_id = Patient.Patient_id
JOIN Ward ON Admission.Ward_id = Ward.Ward_id
WHERE Admission.Discharge_date IS NULL;

-- 9. Medicines with low stock (fewer than 200 units)
SELECT Medicine_name, Stock_qty, Expiry_date
FROM Medicine
WHERE Stock_qty < 200;
