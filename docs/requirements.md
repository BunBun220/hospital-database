# Requirements

## Purpose

Manage the daily records of a hospital: staff, patients, visits, medicines, admissions, and bills.

## Data to store

- Employees (doctors, nurses, pharmacy staff, admin) and the department each one works in
- Patients, with their contact and emergency contact details
- Appointments between patients and doctors
- Diagnoses and prescriptions from each visit
- Medicine stock in the pharmacy
- Ward admissions and billing

## What the system should do

- Record which doctor sees which patient, and when
- Store the diagnosis and the prescribed medicines for each visit
- Track medicine stock and expiry dates
- Track which patients are currently admitted, and to which ward
- Record bills and whether they are paid

## Rules

- Every employee belongs to one department
- A doctor can have many appointments, and a patient can have many appointments
- One prescription can contain many medicines, and one medicine can appear in many prescriptions
- Doctors, nurses, and pharmacy staff are all employees, with extra details stored in their own tables
- A bill is linked to either an appointment or an admission

## Tables

| Group | Tables |
|---|---|
| People | Employee, Doctor, Nurse, Pharmacy_staff_assignment, Patient, Department |
| Visits | Appointment, Medical_records |
| Pharmacy | Medicine, Prescription, Prescription_detail |
| Admissions and billing | Ward, Admission, Billing |
