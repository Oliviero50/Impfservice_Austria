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



begin
	deletePatientBySVN(110117970); 
	--deletePatientBySVN(111); 
    --rollback;
end;
/
-- Check if associated vaccine shpts and side effects are deleted:
begin
select count(*) from vaccine_shot;
select count(*) from Reported_side_effect;
end;