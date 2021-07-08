set serveroutput on;
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



begin
--Testing (PLAY)
	destroyShotsByManufactureId('Moderna'); 
end;
/
begin
--Testing (markieren + STRG E)
	select * from vaccine_package vp join manufacturer man on man.id = vp.manufacturer_id where man.name='Moderna' order by exp_date;
	--rollback; 
end;
/
begin
--Testing (PLAY)
	rollback; 
end;
/