

--------------------------------------------------------
CREATE TABLE Manufacturer
(
    id NUMBER NOT NULL, 
    name VARCHAR2(255) NOT NULL,
    CONSTRAINT Manufacturer_pk PRIMARY KEY (id)
);

--------------------------------------------------------

CREATE TABLE Vaccine_shot
(
    id NUMBER NOT NULL,
    datetime TIMESTAMP NOT NULL,
    patient_id NUMBER NOT NULL,
    doctor_id NUMBER NOT NULL,
    vaccination_centre_id NUMBER NOT NULL,
    vaccine_package_id NUMBER NOT NULL,
    CONSTRAINT Vaccine_shot_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Person
(
    id NUMBER NOT NULL,
    firstname VARCHAR2(255) NOT NULL,
    lastname VARCHAR2(255) NOT NULL,
    dateofbirth DATE NOT NULL,
    sex VARCHAR2(20) NOT NULL,
    address_id NUMBER,
     CONSTRAINT Person_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Patient
(
    person_id NUMBER NOT NULL,
    svn_nummer NUMBER NOT NULL,
     CONSTRAINT Patient_pk PRIMARY KEY (person_id)
);
--------------------------------------------------------

CREATE TABLE Doctor
(
    person_id NUMBER NOT NULL,
    license_id NUMBER NOT NULL,
    CONSTRAINT Doctor_pk PRIMARY KEY (person_id)
);
--------------------------------------------------------

CREATE TABLE Address
(
    id NUMBER NOT NULL,
    street VARCHAR2(255) NOT NULL,
    address_number NUMBER NOT NULL,
    zip Integer NOT NULL,
    city VARCHAR2(255) NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Vaccine
(
    id NUMBER NOT NULL,
    name VARCHAR2(255) NOT NULL,
    type VARCHAR2(255) NOT NULL,
    store_temp NUMBER NOT NULL,
    CONSTRAINT Vaccine_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Appointment
(
    id NUMBER NOT NULL,
    datetime TIMESTAMP NOT NULL,
    patient_id NUMBER NOT NULL,
    vaccination_centre_id NUMBER NOT NULL,
    CONSTRAINT Appointment_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Side_effect_type
(
    id NUMBER NOT NULL,
    effect VARCHAR2(255) NOT NULL,
    CONSTRAINT Side_effect_type_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Addressee
(
    id NUMBER NOT NULL, 
    address_id NUMBER,
    category VARCHAR2(255),
    CONSTRAINT Addressee_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Vaccine_package
(
    id NUMBER NOT NULL,
    charge_id NUMBER NOT NULL,
    exp_date TIMESTAMP NOT NULL,
    num_shots NUMBER NOT NULL,
    vaccine_id NUMBER NOT NULL,
    manufacturer_id NUMBER NOT NULL,
    CONSTRAINT Vaccine_package_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Reported_side_effect
(
    id NUMBER NOT NULL,
    description VARCHAR2(255),
    side_effect_type_id NUMBER NOT NULL,
    vaccine_shot_id NUMBER,
    CONSTRAINT Reported_side_effect_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Package_delivery
(
    id NUMBER NOT NULL,
    datetime TIMESTAMP NOT NULL,
    direction NUMBER NOT NULL,
    vaccine_package_id NUMBER NOT NULL,
    addressee_id NUMBER NOT NULL,
    CONSTRAINT Package_delivery_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Warehouse
(
    id NUMBER NOT NULL, 
    name VARCHAR2(255),
    CONSTRAINT warehouse_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Vaccination_centre
(
    id NUMBER NOT NULL,
    name VARCHAR2(255) NOT NULL,
    capacity NUMBER NOT NULL,
    CONSTRAINT Vaccination_centre_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Distributor
(
    id NUMBER NOT NULL,
    name VARCHAR2(255) NOT NULL,
    CONSTRAINT Distributor_pk PRIMARY KEY (id)
);
--------------------------------------------------------

CREATE TABLE Vaccine_shot_log (
	id NUMBER NOT NULL,
    vaccine_shot_id NUMBER NOT NULL,
    vaccine_shot_datetime TIMESTAMP NOT NULL,
    vaccination_centre_id NUMBER NOT NULL,
    vaccine_package_id NUMBER NOT NULL,
	svn_number_patient NUMBER NOT NULL,
	doctor_license_id NUMBER NOT NULL,
	changeType VARCHAR2(10) NOT NULL,
	zeitstempel TIMESTAMP NOT NULL,
    CONSTRAINT Vaccine_shot_log_pk PRIMARY KEY (id)
);

--------------------------------------------------------
-- Sequences
--------------------------------------------------------
CREATE SEQUENCE seq_vaccination_shot_log;

--------------------------------------------------------
-- Constraints
--------------------------------------------------------
ALTER TABLE Vaccine_shot ADD FOREIGN KEY (patient_id) REFERENCES Patient (person_id) ENABLE;
ALTER TABLE Vaccine_shot ADD FOREIGN KEY (doctor_id) REFERENCES Doctor (person_id) ENABLE;
ALTER TABLE Vaccine_shot ADD FOREIGN KEY (vaccination_centre_id) REFERENCES Vaccination_centre (id) ENABLE;
ALTER TABLE Vaccine_shot ADD FOREIGN KEY (vaccine_package_id) REFERENCES Vaccine_package (id) ENABLE;

ALTER TABLE Reported_side_effect ADD FOREIGN KEY (side_effect_type_id) REFERENCES Side_effect_type (id) ENABLE;
ALTER TABLE Reported_side_effect ADD FOREIGN KEY (vaccine_shot_id) REFERENCES Vaccine_shot (id) ENABLE;

ALTER TABLE Appointment ADD FOREIGN KEY (patient_id) REFERENCES Patient (person_id) ENABLE;
ALTER TABLE Appointment ADD FOREIGN KEY (vaccination_centre_id) REFERENCES Vaccination_centre (id) ENABLE;

ALTER TABLE Vaccine_package ADD FOREIGN KEY (vaccine_id) REFERENCES Vaccine (id) ENABLE;
ALTER TABLE Vaccine_package ADD FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer (id) ENABLE;

ALTER TABLE Package_delivery ADD FOREIGN KEY (vaccine_package_id) REFERENCES Vaccine_package (id) ENABLE;
ALTER TABLE Package_delivery ADD FOREIGN KEY (addressee_id) REFERENCES Addressee (id) ENABLE;

ALTER TABLE Addressee ADD FOREIGN KEY (address_id) REFERENCES Address (id) ENABLE;

ALTER TABLE Person ADD FOREIGN KEY (address_id) REFERENCES Address (id) ENABLE;
