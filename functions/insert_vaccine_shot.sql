CREATE SEQUENCE vaccine_shot_seq START WITH 15;
/

/*********************************************************************
/**
/** Function: add_vaccination
/** In: patient_id - patient's id who gets the shot
/** In: vaccination_centre - id of thew vaccination centre
/** In: package_id - id of the vaccine package to be applied
/** In: doctor_id - id of the doctor applying the shot
/** Returns: id of the created vaccine_shot
/** Developer: Weidel
/** Description: Inserts a newly applied vaccine shot
/**
/*********************************************************************/
CREATE OR REPLACE PROCEDURE add_vaccination(patient_id IN NUMBER, vaccination_centre IN NUMBER, package_id IN NUMBER, doctor_id IN NUMBER)
AS
  d_datetime TIMESTAMP := sysdate;
  i_vaccine_shot_id NUMBER;
  p_package package_delivery%rowtype;

  x_same_person EXCEPTION;
  x_patient_not_found EXCEPTION;
  x_doctor_not_found EXCEPTION;
  x_invalid_package EXCEPTION;
  
  i_patient NUMBER;
  i_doctor NUMBER;
  i_package NUMBER;
  
BEGIN
  IF (patient_id = doctor_id) THEN
    RAISE x_same_person;
  END IF;
  SELECT COUNT(*) INTO i_patient FROM patient WHERE patient.person_id = patient_id;
  IF (i_patient < 1) THEN
    RAISE x_patient_not_found;
  END IF;
  SELECT COUNT(*) INTO i_doctor FROM doctor WHERE doctor.person_id = doctor_id;
  IF (i_doctor < 1) THEN
    RAISE x_doctor_not_found;
  END IF;
  SELECT * INTO p_package FROM package_delivery 
    WHERE package_delivery.id = package_id 
      AND addressee_id = vaccination_centre
      AND direction = 1;
  DBMS_OUTPUT.PUT_LINE(p_package.id || d_datetime);

  INSERT INTO vaccine_shot VALUES (vaccine_shot_seq.NEXTVAL, d_datetime, patient_id, doctor_id, vaccination_centre, package_id);

EXCEPTION
  WHEN x_same_person THEN
    DBMS_OUTPUT.PUT_LINE('person and doctor can not be the same person');
  WHEN x_patient_not_found THEN
    DBMS_OUTPUT.PUT_LINE('invalid patient id');
  WHEN x_doctor_not_found THEN
    DBMS_OUTPUT.PUT_LINE('invalid doctor id');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('package not in vaccination center');
END;
/