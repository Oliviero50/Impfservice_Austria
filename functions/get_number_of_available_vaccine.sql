set serveroutput on;
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



begin
	getNumberOfAvailableVaccine('Comirnaty');
	getNumberOfAvailableVaccine('Moderna Vaccine');
	getNumberOfAvailableVaccine('AstraZeneca Vaccine');
	getNumberOfAvailableVaccine('Jannsen');
	--getNumberOfAvailableVaccine('NOT_EXISTING');
	--getNumberOfAvailableVaccine(null);
end;
/