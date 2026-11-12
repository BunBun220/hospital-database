-- Hospital Management Database: schema (14 tables)
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission` (
  `Admin_id` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int DEFAULT NULL,
  `Ward_id` int DEFAULT NULL,
  `Emp_id` int DEFAULT NULL,
  `Admission_date` datetime DEFAULT NULL,
  `Discharge_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Admin_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Ward_id` (`Ward_id`),
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`Patient_id`),
  CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`Ward_id`) REFERENCES `ward` (`Ward_id`),
  CONSTRAINT `admission_ibfk_3` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Appointment_id` int NOT NULL AUTO_INCREMENT,
  `Appointment_Date` datetime DEFAULT NULL,
  `Patient_id` int DEFAULT NULL,
  `Emp_id` int DEFAULT NULL,
  `Appointment_status` varchar(60) DEFAULT NULL,
  `Appointment_reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Appointment_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`Patient_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `Bill_id` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int DEFAULT NULL,
  `Admin_id` int DEFAULT NULL,
  `Appointment_id` int DEFAULT NULL,
  `Total_amount` decimal(10,2) DEFAULT NULL,
  `Payment_status` varchar(100) DEFAULT NULL,
  `Bill_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Bill_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Admin_id` (`Admin_id`),
  KEY `Appointment_id` (`Appointment_id`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`Patient_id`),
  CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`Admin_id`) REFERENCES `admission` (`Admin_id`),
  CONSTRAINT `billing_ibfk_3` FOREIGN KEY (`Appointment_id`) REFERENCES `appointment` (`Appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept_id` int NOT NULL AUTO_INCREMENT,
  `Dept_name` varchar(150) DEFAULT NULL,
  `Head_of_Dept_id` int DEFAULT NULL,
  PRIMARY KEY (`Dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `Emp_id` int DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `Qualification` varchar(100) DEFAULT NULL,
  `Consultation_fee` decimal(10,2) DEFAULT NULL,
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Emp_id` int NOT NULL AUTO_INCREMENT,
  `Emp_name` varchar(60) DEFAULT NULL,
  `Emp_gender` varchar(30) DEFAULT NULL,
  `Emp_role` varchar(100) DEFAULT NULL,
  `Emp_contact` varchar(30) DEFAULT NULL,
  `Emp_joiningdate` date DEFAULT NULL,
  `Emp_Email` varchar(30) DEFAULT NULL,
  `Emp_salary` decimal(10,2) DEFAULT NULL,
  `Dept_id` int DEFAULT NULL,
  PRIMARY KEY (`Emp_id`),
  KEY `Dept_id` (`Dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Dept_id`) REFERENCES `department` (`Dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `Record_id` int NOT NULL AUTO_INCREMENT,
  `Appointment_id` int DEFAULT NULL,
  `Diagnosis` text,
  `Notes` text,
  `Date_recorded` datetime DEFAULT NULL,
  PRIMARY KEY (`Record_id`),
  KEY `Appointment_id` (`Appointment_id`),
  CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`Appointment_id`) REFERENCES `appointment` (`Appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `Medicine_id` int NOT NULL AUTO_INCREMENT,
  `Medicine_name` varchar(250) DEFAULT NULL,
  `Manufacturer` varchar(250) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Stock_qty` int DEFAULT NULL,
  `Expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`Medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `Emp_id` int DEFAULT NULL,
  `Shift` varchar(100) DEFAULT NULL,
  `Ward_assigned` varchar(100) DEFAULT NULL,
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `Patient_id` int NOT NULL AUTO_INCREMENT,
  `Patient_name` varchar(60) DEFAULT NULL,
  `Patient_gender` varchar(30) DEFAULT NULL,
  `Patient_age` int DEFAULT NULL,
  `Patient_dob` date DEFAULT NULL,
  `Patient_contact` varchar(30) DEFAULT NULL,
  `Patient_bloodgroup` varchar(10) DEFAULT NULL,
  `Patient_emergency_contact_name` varchar(60) DEFAULT NULL,
  `Patient_emergency_contact_phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_staff_assignment`
--

DROP TABLE IF EXISTS `pharmacy_staff_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_staff_assignment` (
  `Emp_id` int DEFAULT NULL,
  `Designation` varchar(100) DEFAULT NULL,
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `pharmacy_staff_assignment_ibfk_1` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `Prescription_id` int NOT NULL AUTO_INCREMENT,
  `Appointment_id` int DEFAULT NULL,
  `Emp_id` int DEFAULT NULL,
  `Date_issued` date DEFAULT NULL,
  PRIMARY KEY (`Prescription_id`),
  KEY `Appointment_id` (`Appointment_id`),
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`Appointment_id`) REFERENCES `appointment` (`Appointment_id`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_detail`
--

DROP TABLE IF EXISTS `prescription_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_detail` (
  `Prescription_id` int DEFAULT NULL,
  `Medicine_id` int DEFAULT NULL,
  `Dosage` varchar(500) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Duration_days` int DEFAULT NULL,
  KEY `Prescription_id` (`Prescription_id`),
  KEY `Medicine_id` (`Medicine_id`),
  CONSTRAINT `prescription_detail_ibfk_1` FOREIGN KEY (`Prescription_id`) REFERENCES `prescription` (`Prescription_id`),
  CONSTRAINT `prescription_detail_ibfk_2` FOREIGN KEY (`Medicine_id`) REFERENCES `medicine` (`Medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ward` (
  `Ward_id` int NOT NULL AUTO_INCREMENT,
  `Ward_type` varchar(150) DEFAULT NULL,
  `Ward_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Ward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'hospital'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-11 15:27:40
