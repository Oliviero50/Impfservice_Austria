/*********************************************************************
/**
/** Table: available_doses
/** Developer: Tomondi
/** Description: TODO
/**
/*********************************************************************/
CREATE OR REPLACE VIEW available_doses AS
SELECT coalesce(vcname, wname) AS name, coalesce(v1.vaccines_delivered - v2.vaccines_administered, v1.vaccines_delivered - v3.vaccines_departed) AS available
FROM (
	SELECT addressee_id, vc.name as vcname, w.name AS wname, SUM(num_shots) AS vaccines_delivered FROM package_delivery pd 
	LEFT JOIN vaccine_package vp ON vp.id = pd.vaccine_package_id
	LEFT JOIN vaccination_centre vc ON vc.id = pd.addressee_id
	LEFT JOIN warehouse w ON w.id = pd.addressee_id
	WHERE Direction = 1
	GROUP BY addressee_id, vc.name, w.name
	) v1
	LEFT JOIN
	(
	SELECT vaccination_centre_id, COUNT(*) AS vaccines_administered FROM vaccine_shot
	GROUP BY vaccination_centre_id
	) v2
ON v1.addressee_id = v2.vaccination_centre_id
LEFT JOIN
	(
	SELECT SUM(num_shots) AS vaccines_departed, addressee_id FROM package_delivery pd 
		LEFT JOIN vaccine_package vp ON vp.id = pd.vaccine_package_id
		WHERE Direction = 0
		GROUP BY addressee_id
	) v3
ON v1.addressee_id = v3.addressee_id;

/*********************************************************************
/**
/** Table: TODO
/** Developer: Weidele
/** Description: Anzahl Appointments pro Center mit Anzahl lagernden Impfdosen
/**
/*********************************************************************/
select name, sum(vaccine_package.num_shots) as shots, p.shots as appointmnets from package_delivery
  join vaccination_centre vc on vc.id = package_delivery.addressee_id
  join vaccine_package on package_delivery.vaccine_package_id = vaccine_package.id
  join (
    select vaccination_centre.id as vcid, count(vaccine_shot.id) as shots from vaccination_centre 
    join vaccine_shot on vaccine_shot.vaccination_centre_id = vaccination_centre.id
    group by vaccination_centre.id
  ) p on p.vcid = vc.id
  group by name, p.shots;
  
/*********************************************************************
/**
/** Table: TODO
/** Developer: Weidele
/** Description: Anzahl Impfstoffe gruppiert nach Hersteller pro Center/Regional Warehouse
/**
/*********************************************************************/

/*********************************************************************
/**
/** Table: reported_side_effects
/** Developer: Weidele
/** Description: Nebenwirkungen pro Altersgruppe und Geschlecht
/**
/*********************************************************************/
select effect, sex, count(person.id) as anzahl from reported_side_effect
  join side_effect_type on side_effect_type_id = side_effect_type.id
  join vaccine_shot on reported_side_effect.vaccine_shot_id = vaccine_shot.id
  join patient on patient.person_id = vaccine_shot.patient_id
  join person on patient.person_id = person.id
  group by effect, sex;


/*********************************************************************
/**
/** Table: TODO
/** Developer: Weidele
/** Description: Public view: anzahl fixierter appointments im Verhältnis zu verfügbaren Impfdosen
/**
/*********************************************************************/