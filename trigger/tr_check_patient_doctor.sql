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