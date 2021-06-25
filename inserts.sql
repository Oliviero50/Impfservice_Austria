INSERT INTO Address (id,street,address_number,zip,city) VALUES (1, 'Wiener Strasse', 15, 1010, 'Wien');
INSERT INTO Address (id,street,address_number,zip,city) VALUES (2, 'Austria Centre', 1, 1220, 'Wien');
INSERT INTO Address (id,street,address_number,zip,city) VALUES (3, 'Ferry Dusika Stadion', 1, 1020, 'Wien');
INSERT INTO Address (id,street,address_number,zip,city) VALUES (4, 'Franz Jonas Platz', 1, 1150, 'Wien');
INSERT INTO Address (id,street,address_number,zip,city) VALUES (5, 'Keplerstrasse', 25, 1100, 'Wien');

INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('1','Harald','Wahl',to_date('11.01.1970','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('2','Alexander','Neubauer',to_date('01.01.2000','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('3','Jack','Millhouse',to_date('01.03.1950','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('4','Hans','Klauber',to_date('01.03.1951','DD.MM.YYYY'), 'female',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('5','Fritz','Neckam',to_date('01.03.1952','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('6','Georg','Hagmann',to_date('01.03.1953','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('7','Andrea','Brandstetter',to_date('01.03.1954','DD.MM.YYYY'), 'female',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('8','Phil','Niedermayr',to_date('01.03.1955','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('9','Martin','Hartlauer',to_date('01.03.1956','DD.MM.YYYY'), 'male',1);
INSERT INTO Person (id,firstname,lastname,dateofbirth,sex,address_id) VALUES ('10','Martina','Saturn',to_date('01.03.1957','DD.MM.YYYY'), 'female',1);

INSERT INTO Patient (person_id, svn_nummer) VALUES (1, 110117970);
INSERT INTO Patient (person_id, svn_nummer) VALUES (2, 110112000);
INSERT INTO Patient (person_id, svn_nummer) VALUES (3, 110511950);
INSERT INTO Patient (person_id, svn_nummer) VALUES (4, 120017195);
INSERT INTO Patient (person_id, svn_nummer) VALUES (5, 140819195);

INSERT INTO Doctor (person_id, license_id) VALUES (6, 140941953);
INSERT INTO Doctor (person_id, license_id) VALUES (7, 180417954);
INSERT INTO Doctor (person_id, license_id) VALUES (8, 150791955);
INSERT INTO Doctor (person_id, license_id) VALUES (9, 090181956);
INSERT INTO Doctor (person_id, license_id) VALUES (10, 125011957);

INSERT INTO Vaccine (id, name, type, store_temp) VALUES (1,'Comirnaty', 'mRNA', -80);
INSERT INTO Vaccine (id, name, type, store_temp) VALUES (2,'Moderna Vaccine', 'mRNA', -20);
INSERT INTO Vaccine (id, name, type, store_temp) VALUES (3,'AstraZeneca Vaccine', 'vector', -8);
INSERT INTO Vaccine (id, name, type, store_temp) VALUES (4,'Jannsen', 'vector', 8);

INSERT INTO Manufacturer (id, name) VALUES (1,'Pfizer');
INSERT INTO Manufacturer (id, name) VALUES (2,'Moderna');
INSERT INTO Manufacturer (id, name) VALUES (3,'Astra Zeneca');
INSERT INTO Manufacturer (id, name) VALUES (4,'Johnson&Johnson');
INSERT INTO Manufacturer (id, name) VALUES (5,'Merck');

INSERT INTO Side_effect_type (id, effect) VALUES (1,'Kopfschmerzen');
INSERT INTO Side_effect_type (id, effect) VALUES (2,'Muskelschmerzen');
INSERT INTO Side_effect_type (id, effect) VALUES (3,'Fieber');
INSERT INTO Side_effect_type (id, effect) VALUES (4,'Trombose');
INSERT INTO Side_effect_type (id, effect) VALUES (5,'Myokarditis');
INSERT INTO Side_effect_type (id, effect) VALUES (6,'Stichschmerzen');

INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (1,100,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (2,100,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (3,200,to_date('01.01.2022','DD.MM.YYYY'),500,2,2);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (4,200,to_date('01.01.2022','DD.MM.YYYY'),500,2,2);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (5,300,to_date('01.01.2022','DD.MM.YYYY'),800,3,3);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (6,300,to_date('01.01.2022','DD.MM.YYYY'),800,3,3);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (7,780,to_date('01.01.2022','DD.MM.YYYY'),1000,4,4);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (8,709,to_date('01.01.2022','DD.MM.YYYY'),1000,4,5);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (9,687,to_date('01.01.2022','DD.MM.YYYY'),1000,3,3);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (10,145,to_date('01.01.2022','DD.MM.YYYY'),1000,3,3);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (11,205,to_date('01.01.2022','DD.MM.YYYY'),1000,3,3);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (12,406,to_date('01.01.2022','DD.MM.YYYY'),1000,2,2);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (13,700,to_date('01.01.2022','DD.MM.YYYY'),1000,2,2);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (14,704,to_date('01.01.2022','DD.MM.YYYY'),1000,2,2);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (15,454,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (16,224,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (17,557,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (18,254,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (19,340,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);
INSERT INTO Vaccine_package (id, charge_id, exp_date, num_shots, vaccine_id, manufacturer_id) VALUES (20,414,to_date('01.01.2022','DD.MM.YYYY'),1000,1,1);

INSERT INTO Distributor (id, name) VALUES (1, 'Bundesheer');
INSERT INTO Distributor (id, name) VALUES (2, 'Fedex');
INSERT INTO Distributor (id, name) VALUES (3, 'UPC');
INSERT INTO Distributor (id, name) VALUES (4, 'Post AG');

INSERT INTO Vaccination_centre (id,name,capacity) VALUES (1,'Austria Centre', 1000);
INSERT INTO Vaccination_centre (id,name,capacity) VALUES (2,'Stadthalle', 500);
INSERT INTO Vaccination_centre (id,name,capacity) VALUES (3,'Ferry Dusika Stadion', 250);

INSERT INTO Warehouse(id) VALUES(4);
INSERT INTO Warehouse(id) VALUES(5);

INSERT INTO Addressee (id,address_id, category) VALUES (1,2,'vaccination centre');
INSERT INTO Addressee (id,address_id, category) VALUES (2,4,'vaccination centre');
INSERT INTO Addressee (id,address_id, category) VALUES (3,2,'vaccination centre');
INSERT INTO Addressee (id,address_id, category) VALUES (4,1,'warehouse');
INSERT INTO Addressee (id,address_id, category) VALUES (5,5,'warehouse');

INSERT INTO Appointment(id,datetime,patient_id,vaccination_centre_id) VALUES (1,to_date('25.06.2021','DD.MM.YYYY'),1,1);
INSERT INTO Appointment(id,datetime,patient_id,vaccination_centre_id) VALUES (2,to_date('29.06.2021','DD.MM.YYYY'),2,3);
INSERT INTO Appointment(id,datetime,patient_id,vaccination_centre_id) VALUES (3,to_date('30.06.2021','DD.MM.YYYY'),3,2);
INSERT INTO Appointment(id,datetime,patient_id,vaccination_centre_id) VALUES (4,to_date('25.06.2021','DD.MM.YYYY'),4,1);
INSERT INTO Appointment(id,datetime,patient_id,vaccination_centre_id) VALUES (5,to_date('29.06.2021','DD.MM.YYYY'),5,3);

INSERT INTO Vaccine_shot(id,datetime,patient_id,doctor_id,vaccination_centre_id,vaccine_package_id) VALUES (1,to_date('25.06.2021','DD.MM.YYYY'),1,6,1,1);
INSERT INTO Vaccine_shot(id,datetime,patient_id,doctor_id,vaccination_centre_id,vaccine_package_id) VALUES (2,to_date('29.06.2021','DD.MM.YYYY'),2,7,3,3);
INSERT INTO Vaccine_shot(id,datetime,patient_id,doctor_id,vaccination_centre_id,vaccine_package_id) VALUES (3,to_date('30.06.2021','DD.MM.YYYY'),3,8,2,2);
INSERT INTO Vaccine_shot(id,datetime,patient_id,doctor_id,vaccination_centre_id,vaccine_package_id) VALUES (4,to_date('29.06.2021','DD.MM.YYYY'),4,9,1,4);

INSERT INTO Reported_side_effect(id, side_effect_type_id, vaccine_shot_id) VALUES (1,1,1);
INSERT INTO Reported_side_effect(id, side_effect_type_id, vaccine_shot_id) VALUES (2,3,2);

INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (1,to_date('20.06.2021','DD.MM.YYYY'),0,1,4);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (2,to_date('20.06.2021','DD.MM.YYYY'),1,1,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (3,to_date('20.06.2021','DD.MM.YYYY'),0,2,4);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (4,to_date('20.06.2021','DD.MM.YYYY'),1,2,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (5,to_date('20.06.2021','DD.MM.YYYY'),0,3,4);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (6,to_date('20.06.2021','DD.MM.YYYY'),1,2,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (7,to_date('20.06.2021','DD.MM.YYYY'),0,4,4);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (8,to_date('20.06.2021','DD.MM.YYYY'),1,4,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (9,to_date('20.06.2021','DD.MM.YYYY'),0,5,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (10,to_date('20.06.2021','DD.MM.YYYY'),1,5,2);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (11,to_date('20.06.2021','DD.MM.YYYY'),0,6,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (12,to_date('20.06.2021','DD.MM.YYYY'),1,6,3);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (13,to_date('20.06.2021','DD.MM.YYYY'),0,7,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (14,to_date('20.06.2021','DD.MM.YYYY'),1,7,3);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (15,to_date('20.06.2021','DD.MM.YYYY'),0,8,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (16,to_date('20.06.2021','DD.MM.YYYY'),1,8,3);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (17,to_date('20.06.2021','DD.MM.YYYY'),0,9,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (18,to_date('20.06.2021','DD.MM.YYYY'),1,9,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (19,to_date('20.06.2021','DD.MM.YYYY'),0,9,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (20,to_date('20.06.2021','DD.MM.YYYY'),1,9,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (21,to_date('20.06.2021','DD.MM.YYYY'),0,10,5);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (22,to_date('20.06.2021','DD.MM.YYYY'),1,10,1);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (23,to_date('20.06.2021','DD.MM.YYYY'),0,11,4);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (24,to_date('20.06.2021','DD.MM.YYYY'),1,11,2);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (25,to_date('20.06.2021','DD.MM.YYYY'),0,12,4);
INSERT INTO Package_delivery (id, datetime, direction, vaccine_package_id, addressee_id) VALUES (26,to_date('20.06.2021','DD.MM.YYYY'),1,12,2);