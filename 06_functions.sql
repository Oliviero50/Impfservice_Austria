set serveroutput on;
/

------------------------------------------------------------------------------
-- Lösche einen Patienten komplett aus der Datenbank. 
-- (Inklusive Person, Appointment, Patient, vaccine_shot, reported_side_effects)
-- Input: SVN-Nummer
------------------------------------------------------------------------------

create or replace procedure deletePatientBySVN(v_svn in number)
as
	v_person_id number := -1;
	v_address_id number := -1;
	v_vaccine_shot_id number := -1;
	i_help number := -1;
  --i_help vaccine.name%type;
  ex_no_input exception;
  ex_no_person exception;
  v_err_code number;
  v_err_msg varchar2(200);
  
begin
	if v_svn is null then
		raise ex_no_input;
	end if;

	-- person id speichern
	select count(*) into v_person_id from person ps join patient pt on ps.id = pt.person_id where svn_nummer=v_svn;
	if v_person_id = 0 then
		raise ex_no_person;
	end if;
  select ps.id into v_person_id from person ps join patient pt on ps.id = pt.person_id where svn_nummer=v_svn;
    

    -- address id speichern
    select ps.address_id into v_address_id from person ps where id=v_person_id;
    if v_address_id > -1 then
        -- Lösche appoinment
        delete from Appointment where patient_id = v_person_id;
		end if;
    

    -- Lösche alle reported_effect_type der person
    -- Lösche alle vaccine_shot der person
    LOOP
		dbms_output.put_line(i_help);
		select count(*) into i_help from vaccine_shot where patient_id = v_person_id;
		EXIT WHEN i_help=0;
		select id into v_vaccine_shot_id from vaccine_shot where patient_id = v_person_id and ROWNUM <= 1;
        delete from Reported_side_effect where vaccine_shot_id = v_vaccine_shot_id;
        delete from vaccine_shot where id = v_vaccine_shot_id;
	END LOOP;

    -- Lösche patient
    delete from patient where person_id = v_person_id;
    -- Lösche person
    delete from person where id = v_person_id;

	dbms_output.put_line('Patient mit SVN ' || v_svn || ' wurde gelöscht');
	
	exception
	  when no_data_found then
	   raise_application_error(-20100, 'keine Person mit SVN ' || v_svn || ' gefunden'); 
      
	  when ex_no_input then
	   raise_application_error(-20101, 'keine SVN angegeben'); 

	  when ex_no_person then
	   raise_application_error(-20102, 'keine Person gefunden'); 
 
    when others then
     v_err_code := sqlcode;
     v_err_msg := sqlerrm;
     dbms_output.put_line('Errorcode: ' || v_err_code ||' - Errormessage: ' || v_err_msg);

end;
/



------------------------------------------------------------------------------
-- Setzt die Anzahl aller shots eines Manufactures auf 0 (num_shots in Table vaccine_package)
-- Input: Name des Manufactures
------------------------------------------------------------------------------

create or replace procedure destroyShotsByManufactureId(v_manufacture in string)
as
	v_anzahl_packages number := 0;
	v_anzahl_shots number := 0;
 
  i_help_manufacturer_id number;
  ex_no_input exception;
  v_err_code number;
  v_err_msg varchar2(200);

  -- Cursor deklarieren
  cursor c_vaccine_packages is select * from vaccine_package vp join manufacturer man on man.id = vp.manufacturer_id where man.name=v_manufacture order by exp_date;
  
begin
	if v_manufacture is null then
		raise ex_no_input;
	end if;
     dbms_output.put_line('test 1: ');
	--Impliziter Cursor mit for .. loop
  for v_result in c_vaccine_packages
  
	-- Cursor durchlaufen
  loop
  --anzahl packages loggen
    v_anzahl_packages := v_anzahl_packages + 1;
	-- anzahl aller shots loggen
    v_anzahl_shots := v_anzahl_shots + v_result.NUM_SHOTS;
  end loop;
  dbms_output.put_line('test 2: ');
  -- anzahl der shots im package auf 0 setzen
  select id into i_help_manufacturer_id from manufacturer where name=v_manufacture;
  update vaccine_package set num_shots=0 where manufacturer_id=i_help_manufacturer_id;
 
 
	dbms_output.put_line('Von ' || v_manufacture || ' wurden ' || v_anzahl_packages || ' Packages und ' || v_anzahl_shots || ' Shots gefunden');
	dbms_output.put_line('Die Anzahl aller shots des Herstellers ' || v_manufacture || ' wurde auf 0 gesetzt');
	
	exception
	  when no_data_found then
	   raise_application_error(-20100, 'kein Impfstoff von ' || v_manufacture || ' gefunden'); 
      
	  when ex_no_input then
	   raise_application_error(-20101, 'kein Impfstoff angegeben'); 
 
    when others then
     v_err_code := sqlcode;
     v_err_msg := sqlerrm;
     dbms_output.put_line('Errorcode: ' || v_err_code ||' - Errormessage: ' || v_err_msg);

end;
/

-- /*********************************************************************
-- /**
-- /** Function: getTeilimmunisierteCount
-- /** Developer: Arnauer
-- /** Description: Anzahl Patienten mit einer Impfung die äter als 22 Tage ist
-- /**
-- /*********************************************************************/
create or replace function getTeilimmunisierteCount
return number
is
  i_anzahl_teilimmunisiert number := 0;
begin

  select * into i_anzahl_teilimmunisiert from teilimmunisiert;
  dbms_output.put_line('Anzahl Teilimmunisterter Patienten: ' || i_anzahl_teilimmunisiert);
  return i_anzahl_teilimmunisiert;
end;
/


-- /*********************************************************************
-- /**
-- /** Function: getVollimmunisierteCount
-- /** Developer: Arnauer
-- /** Description: Anzahl Patienten mit 2 Impfungen
-- /**
-- /*********************************************************************/
create or replace function getVollimmunisierteCount
return number
is
  i_anzahl_vollimmunisiert number := 0;
begin

  select * into i_anzahl_vollimmunisiert from vollimmunisiert;
  dbms_output.put_line('Anzahl Vollimmunisterter Patienten: ' || i_anzahl_vollimmunisiert);
  return i_anzahl_vollimmunisiert;
end;
/


-- /*********************************************************************
-- /**
-- /** Function: getVaccineShotsCount
-- /** Developer: Arnauer
-- /** Description: Anzahl der Vaccines, die bereits verabreicht wurden
-- /**
-- /*********************************************************************/
create or replace function getVaccineShotsCount
return number
is
  i_anzahl_vaccine_shots number := 0;
begin

  select count(*) into i_anzahl_vaccine_shots from shots_list;
  dbms_output.put_line('Anzahl verabreichter Impfung Shots: ' || i_anzahl_vaccine_shots);
  return i_anzahl_vaccine_shots;
end;
/


-- /*********************************************************************
-- /**
-- /** Function: getDeliveredDosesCount
-- /** Developer: Tomondy
-- /** Description: Anzahl der Shots, die an die Impfzentren geliefert wurde.
-- /**
-- /*********************************************************************/
CREATE OR REPLACE FUNCTION getDeliveredDosesCount 
RETURN NUMBER 
IS 
	i_delivered_doses_count NUMBER := 0;
BEGIN
SELECT SUM(vp.num_shots) INTO i_delivered_doses_count
FROM package_delivery pd
  JOIN vaccine_package vp ON vp.id = pd.vaccine_package_id
WHERE addressee_id IN (SELECT id FROM vaccination_centre)
AND   direction = 1;
RETURN i_delivered_doses_count;
END;
/




------------------------------------------------------------------------------
-- Anzahl der noch unbenutzten shots eines impfstoffes
------------------------------------------------------------------------------

create or replace procedure getNumberOfAvailableVaccine(v_i in string)
as
	v_anzahl_all_vaccines number := 0;
	v_anzahl_used_vaccines number := 0;
	v_anzahl_available_vaccines number := 0;
  -- Cursor deklarieren
  cursor c_vaccine_packages is select * from vaccine_package vp join Vaccine vacc on vacc.id = vp.vaccine_id order by name;
  i_help vaccine.name%type;
  ex_no_input exception;
  v_err_code number;
  v_err_msg varchar2(200);
  
begin
	if v_i is null then
		raise ex_no_input;
	end if;
	
  --Impliziter Cursor mit for .. loop
  for v_result in c_vaccine_packages
  
	-- Cursor durchlaufen
  loop
    if v_result.NAME = v_i then 
      v_anzahl_all_vaccines := v_anzahl_all_vaccines + v_result.NUM_SHOTS;
    end if;
    
  end loop;
  
  select name into i_help from vaccine where name=v_i;
  -- Anzahl der bereits getätigten Impfungen eines bestimmten Impfstoff 
	select count(*) into v_anzahl_used_vaccines from vaccine_shot vc join vaccine_package vp on vc.vaccine_package_id = vp.id join vaccine vacc on vacc.id = vp.vaccine_id 
	Where vacc.name = v_i;

	v_anzahl_available_vaccines := v_anzahl_all_vaccines - v_anzahl_used_vaccines;
	dbms_output.put_line('Von ' || v_i || ' sind ' || v_anzahl_available_vaccines || ' gerade verfuegbar');
	
	exception
	  when no_data_found then
	   raise_application_error(-20100, 'kein Impfstoff mit dem Namen ' || v_i || ' gefunden'); 
      
	  when ex_no_input then
	   raise_application_error(-20101, 'kein Impfstoff angegeben'); 
 
    when others then
     v_err_code := sqlcode;
     v_err_msg := sqlerrm;
     dbms_output.put_line('Errorcode: ' || v_err_code ||' - Errormessage: ' || v_err_msg);

end;
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