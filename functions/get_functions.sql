set serveroutput on;
/
/*********************************************************************
/**
/** Function: getPersons
/** Developer: Arnauer
/** Description: Zeigt alle Personen (Patienten und Doktoren) an
/**
/*********************************************************************/


set serveroutput on;
/


create or replace procedure getPersons
as
  v_current_person person%rowType;
  cursor c_persons is select * from person;
begin

  --Impliziter Cursor mit for .. loop
  for v_result in c_persons
  -- Cursor durchlaufen
  loop
  v_current_person:=v_result;
  dbms_output.put_line('New Person:');
  dbms_output.put_line(v_current_person.ID);
  dbms_output.put_line(v_current_person.FIRSTNAME);
  dbms_output.put_line(v_current_person.LASTNAME);
  dbms_output.put_line(v_current_person.DATEOFBIRTH);
  dbms_output.put_line(v_current_person.SEX);
  dbms_output.put_line(v_current_person.ADDRESS_ID);
  end loop;

end;
/



begin
	getPersons();
end;
/