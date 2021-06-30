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

