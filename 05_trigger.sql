/*********************************************************************
/**
/** Trigger: trigger_check_capacity
/** Type: Before each row
/** Type Extension: insert
/** Developer: wi19b066
/** Description: this trigger is responsible for checking new inserts
/** on appointment. If the capacity of the corresponding vaccination
/** centre is for the desired day already reached, the appointment
/** will not be saved and an error will be shown.
/**
/**********************************************************************/

create or replace trigger trigger_check_capacity
before insert on appointment
for each row
declare
    n_total_capacity_centre number;
    n_booked_capacity_centre number;
    v_vaccination_centre_name Vaccination_centre.name%type;
    v_desired_date varchar2(50);
begin

    SELECT capacity into n_total_capacity_centre from Vaccination_centre
        where id = :new.vaccination_centre_id;

    SELECT count(*) into n_booked_capacity_centre from Appointment
        where vaccination_centre_id = :new.vaccination_centre_id and datetime = :new.datetime;

    SELECT name into v_vaccination_centre_name from Vaccination_centre
        where id = :new.vaccination_centre_id;
        
	v_desired_date := to_char(cast(:new.datetime as date),'DD-MM-YYYY');

    IF n_booked_capacity_centre >= n_total_capacity_centre THEN
        raise_application_error(-20001, 'Im gewünschten Impfzentrum "' || v_vaccination_centre_name || 
        '" gibt am angegebenen Tag (' || v_desired_date || ') keine verfügbare Kapazität mehr!');
    END IF;

end;
/

/*********************************************************************
/**
/** Trigger: trigger_check_ins_app
/** Type: Before each row
/** Type Extension: insert
/** Developer: wi19b066
/** Description: this trigger is responsible for checking new inserts
/** on appointment. If the corresponding patient has already two
/** appointments an error gets thrown and the insert will not happen.
/**
/**********************************************************************/

create or replace trigger trigger_check_ins_app
before insert on appointment
for each row
declare
    n_help number;
begin

    SELECT count(*) into n_help from appointment
        where patient_id = :new.patient_id;

    IF n_help > 1 THEN
        raise_application_error(-30000, 'Für den Patienten mit der ID ' || :new.patient_id || ' sind bereits zwei Impftermine gebucht!');
    END IF;

end;
/

/*********************************************************************
/**
/** Trigger: trigger_check_patient_doctor
/** Type: Before each row
/** Type Extension: insert
/** Developer: wi19b066
/** Description: this trigger is responsible for checking new inserts
/** on vaccine_shot. It must be avoided, that doctor_id and patient_id
/** are equal, thus a doctor cannot vaccinate himself.
/**
/**********************************************************************/

create or replace trigger trigger_check_patient_doctor
before insert on vaccine_shot
for each row
declare
begin

    IF :new.doctor_id = :new.patient_id THEN
        raise_application_error(-20000, 'Ein Arzt darf sich nicht selbst impfen!');
    END IF;

end;
/

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