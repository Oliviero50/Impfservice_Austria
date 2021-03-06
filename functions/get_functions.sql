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
-- mit STRG+E ausführen
-- select getTeilimmunisierteCount() as Teilimmunistert from dual;


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
-- mit STRG+E ausführen
-- select getVollimmunisierteCount() as Vollimmunistert from dual;


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
-- mit STRG+E ausführen
-- select getVaccineShotsCount() as AnzahlShots from dual;


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
-- mit STRG+E ausführen
-- select getDeliveredDosesCount() as AnzahlDeliverdShots from dual;
/









-- /*********************************************************************
-- /**
-- /** Function: getPersons
-- /** Developer: Arnauer
-- /** Description: Zeigt alle Personen (Patienten und Doktoren) in der Db an
-- /**
-- /*********************************************************************/


-- set serveroutput on;
-- /


-- create or replace procedure getPersons
-- as
--   v_current_person person%rowType;
--   cursor c_persons is select * from person;
-- begin

--   --Impliziter Cursor mit for .. loop
--   for v_result in c_persons
--   -- Cursor durchlaufen
--   loop
--   v_current_person:=v_result;
--   dbms_output.put_line('New Person:');
--   dbms_output.put_line(v_current_person.ID);
--   dbms_output.put_line(v_current_person.FIRSTNAME);
--   dbms_output.put_line(v_current_person.LASTNAME);
--   dbms_output.put_line(v_current_person.DATEOFBIRTH);
--   dbms_output.put_line(v_current_person.SEX);
--   dbms_output.put_line(v_current_person.ADDRESS_ID);
--   end loop;

-- end;
-- /



-- begin
-- 	getPersons();
-- end;
-- /


/
