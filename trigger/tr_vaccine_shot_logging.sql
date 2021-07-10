create or replace procedure write_vaccine_shot_log(
    i_vaccine_shot_id number,
    i_vaccine_shot_datetime timestamp,
    i_patient_id number,
    i_doctor_id number,
    i_vaccination_centre_id number,
    i_vaccine_package_id number,
	i_ChangeType varchar2)
as
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_systimestamp timestamp;
  v_cur_seq_vaccine_shot_log integer;
  v_svn_number number;
  v_doctor_license_id number;
begin
  select systimestamp into v_systimestamp from dual;
  select seq_vaccination_shot_log.nextval into v_cur_seq_vaccine_shot_log from dual;
  select svn_nummer into v_svn_number from patient where person_id = i_patient_id;
  select license_id into v_doctor_license_id from doctor where person_id = i_doctor_id;
  insert into vaccine_shot_log values(  v_cur_seq_vaccine_shot_log,
                                            i_vaccine_shot_id,
                                            i_vaccine_shot_datetime,
                                            i_vaccination_centre_id,
                                            i_vaccine_package_id,
                                            v_svn_number,
                                            v_doctor_license_id,
                                            i_ChangeType,
                                            v_systimestamp);
  commit;
end;
/

create or replace trigger trigger_vaccine_shot_logging
before insert or update or delete on vaccine_shot
for each row
declare
begin
  IF INSERTING THEN
    write_vaccine_shot_log(:new.id, :new.datetime, :new.patient_id, :new.doctor_id, :new.vaccination_centre_id, :new.vaccine_package_id, 'Insert');
  ELSIF UPDATING THEN
    write_vaccine_shot_log(:old.id, :old.datetime, :old.patient_id, :old.doctor_id, :old.vaccination_centre_id, :old.vaccine_package_id, 'Update old');
    write_vaccine_shot_log(:new.id, :new.datetime, :new.patient_id, :new.doctor_id, :new.vaccination_centre_id, :new.vaccine_package_id, 'Update new');
  ELSE 
    write_vaccine_shot_log(:old.id, :old.datetime, :old.patient_id, :old.doctor_id, :old.vaccination_centre_id, :old.vaccine_package_id, 'Delete');
   END IF;
end;
/