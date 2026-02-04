/*Create a table named Patients with the following fields:
PatientID, PatientName, Age, Gender, AdmissionDate.*/

CREATE DATABASE Hospital;
USE Hospital;
CREATE TABLE Patients 
(Patient_id     INT,
Patient_name   VARCHAR(50),
Age            INT,
Gender         VARCHAR(10),
Admission_date DATE);

/*Add a new column DoctorAssigned VARCHAR(50) to the Patients table.*/

ALTER TABLE Patients
ADD COLUMN Doctor_Assigned VARCHAR(50);

/* Increase the length of PatientName from VARCHAR(50) to VARCHAR(100).*/

ALTER TABLE Patients
MODIFY COLUMN Patient_name VARCHAR(100);
 
/* Rename the table Patients to Patient_Info.*/

RENAME TABLE Patients TO Patient_Info;

/* At year-end, delete all patient records but keep the table. Later, remove it permanently.*/

TRUNCATE TABLE Patient_Info;
DROP TABLE Patient_Info;







