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