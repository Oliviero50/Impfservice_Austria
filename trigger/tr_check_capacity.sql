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