/**********************************************************
 * CLEANUP: Drops all tables and indexes
 **********************************************************/
DROP TABLE Vaccine_package CASCADE CONSTRAINTS;
DROP TABLE Package_delivery CASCADE CONSTRAINTS;
DROP TABLE Addressee CASCADE CONSTRAINTS;
DROP TABLE Vaccine_shot CASCADE CONSTRAINTS;
DROP TABLE Vaccination_centre CASCADE CONSTRAINTS;
DROP TABLE Reported_side_effect CASCADE CONSTRAINTS;
DROP TABLE Person CASCADE CONSTRAINTS;
DROP TABLE Warehouse CASCADE CONSTRAINTS;
DROP TABLE Side_effect_type CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;
DROP TABLE Vaccine CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Address CASCADE CONSTRAINTS;
DROP TABLE Manufacturer CASCADE CONSTRAINTS;
DROP TABLE Distributor CASCADE CONSTRAINTS;
DROP TABLE vaccine_shot_log;
DROP SEQUENCE seq_vaccination_shot_log;

DROP INDEX package_delivery_vp_idx;
DROP INDEX package_delivery_ad_idx;
DROP INDEX vaccine_shot_patient_idx;
DROP INDEX reported_side_effect_type_idx;
DROP INDEX appointment_patient_idx;
