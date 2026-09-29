Create database Meridian_Hospital

Use Meridian_Hospital;

Create table departments (
departmentid INT PRIMARY KEY,
departmentname VARCHAR(50) NOT NULL,
description VARCHAR(300)
);

Create table doctors (
doctorid INT PRIMARY KEY,
doctorname VARCHAR(20) NOT NULL,
specialization VARCHAR(100),
experience INT,
departmentid INT,
phone VARCHAR(12),
FOREIGN KEY (departmentid) REFERENCES departments(departmentid)
);

Create table patients (
patientid INT PRIMARY KEY,
patientname VARCHAR(30) NOT NULL,
gender VARCHAR(10),
dateofbirth DATE,
phone VARCHAR(12),
email VARCHAR(50),
city VARCHAR(30),
bloodgroup VARCHAR(5)
);

Create table rooms (
roomid INT PRIMARY KEY,
roomnumber VARCHAR(10) NOT NULL,
roomtype VARCHAR(50),
dailyrent DECIMAL(10,2),
status_ VARCHAR(20)
);

Create table appointments (
appointmentid INT PRIMARY KEY,
patientid INT NOT NULL,
doctorid INT NOT NULL,
appointmentdate DATE,
appointmenttime TIME,
appointmenttype VARCHAR(50),
status_ VARCHAR(20),
FOREIGN KEY (patientid) REFERENCES patients (patientid),
FOREIGN KEY (doctorid) REFERENCES doctors (doctorid)
);

Create table admissions (
admissionid INT PRIMARY KEY,
patientid INT NOT NULL,
doctorid INT NOT NULL,
roomid INT NOT NULL,
admissiondate DATE,
dischargedate DATE,
reason VARCHAR(100),
status_ VARCHAR(20),
FOREIGN KEY (patientid) REFERENCES patients (patientid),
FOREIGN KEY (patientid) REFERENCES patients (patientid),
FOREIGN KEY (roomid) REFERENCES rooms (roomid)
);

Create table medicines (
medicineid INT PRIMARY KEY,
medicinename VARCHAR(50) NOT NULL,
form VARCHAR(15),
unitprice DECIMAL(10,2),
stockquantity int
);

Create table prescriptions (
prescriptionid INT PRIMARY KEY,
patientid INT NOT NULL,
doctorid INT NOT NULL,
medicineid INT NOT NULL,
prescriptiondate DATE,
dosage VARCHAR(100),
durationdays INT,
FOREIGN KEY (patientid) REFERENCES patients(patientid),
FOREIGN KEY (doctorid) REFERENCES doctors(doctorid),
FOREIGN KEY (medicineid) REFERENCES medicines(medicineid)
);

Create table billing (
billid INT PRIMARY KEY,
patientid INT NOT NULL,
admissionid INT,
billdate DATE,
billtype VARCHAR(50),
totalamount DECIMAL(12,2),
paymentstatus VARCHAR(30),
FOREIGN KEY (patientid) REFERENCES patients(patientid),
FOREIGN KEY (admissionid) REFERENCES admissions(admissionid)
);


Create table payments (
paymentid INT PRIMARY KEY,
billid INT NOT NULL,
paymentdate DATE,
amount DECIMAL(12,2),
paymentmethod VARCHAR(30),
transactionreference VARCHAR(50),
FOREIGN KEY (billid) REFERENCES billing(billid)
);

alter table patients
MODIFY column phone VARCHAR(15);

Select * from patients
WHERE city = 'Salem';

Select * from doctors 
where specialization = "Neurologist";

Select * from patients
where gender = "Male";

Select * from appointments 
where status_ = "Completed";

Select * from billing
order by totalamount asc;

Select paymentstatus, sum(totalamount) as total_value
from billing
group by paymentstatus;

Select medicinename, sum(unitprice) AS Medicine_Price
from medicines
group by medicinename
order by Medicine_Price desc;

Select billdate,sum(totalamount) as total_value
from billing
group by billdate
having total_value > 5000
order by billdate;

Select * from admissions;



















