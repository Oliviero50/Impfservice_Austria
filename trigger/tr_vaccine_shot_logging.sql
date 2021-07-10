/*********************************************************************
/**
/** Trigger: trigger_vaccine_shot_logging
/** Type: Before each row
/** Type Extension: insert, update, delete
/** Developer: wi19b066
/** Description: this trigger is responsible for logging all changes
/** (insert, update and delete) on table vaccine_shot in order to have
/** all changes stored for later analysis.
/**
/**********************************************************************/

create or replace procedure write_vaccine_shot_log(
    n_vaccine_shot_id number,
    ts_vaccine_shot_datetime timestamp,
    n_patient_id number,
    n_doctor_id number,
    n_vaccination_centre_id number,
    n_vaccine_package_id number,
	v_ChangeType varchar2)
as
  PRAGMA AUTONOMOUS_TRANSACTION;
  ts_systimestamp timestamp;
  i_cur_seq_vaccine_shot_log integer;
  n_svn_number number;
  n_doctor_license_id number;
begin
  select systimestamp into ts_systimestamp from dual;
  select seq_vaccination_shot_log.nextval into i_cur_seq_vaccine_shot_log from dual;
  select svn_nummer into n_svn_number from patient where person_id = n_patient_id;
  select license_id into n_doctor_license_id from doctor where person_id = n_doctor_id;
  insert into vaccine_shot_log values(  i_cur_seq_vaccine_shot_log,
                                            n_vaccine_shot_id,
                                            ts_vaccine_shot_datetime,
                                            n_vaccination_centre_id,
                                            n_vaccine_package_id,
                                            n_svn_number,
                                            n_doctor_license_id,
                                            v_ChangeType,
                                            ts_systimestamp);
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