select * from user_tables;

drop tablespace dbs_project INCLUDING CONTENTS AND DATAFILES;

create tablespace dbs_project
	datafile 'dbs_project_dat.dbf'
	size 100m;
	
drop user project_user;
drop user admin;
drop user nurse;
drop user logistics;
drop user doctor;
	
create user project_user
	identified by project_user
	default tablespace dbs_project
	quota 100m on dbs_project;
	
create user admin
	identified by admin
	default tablespace dbs_project
	quota 100m on dbs_project;
	
create user nurse
	identified by nurse
	default tablespace dbs_project
	quota 100m on dbs_project;
	
create user logistics
	identified by logistics
	default tablespace dbs_project
	quota 100m on dbs_project;
	
create user doctor
	identified by doctor
	default tablespace dbs_project
	quota 100m on dbs_project;

-- connect for all users
grant connect to project_user, admin, nurse, logistics, doctor;

-- admin
grant all privileges to admin;

-- nurse
grant insert, update, delete on vaccine_shot to nurse;
grant insert, update, delete on reported_side_effect to nurse;

-- logistics
grant insert, update, delete on package_delivery to logistics;
grant insert, update, delete on vaccine_package to logistics;

-- doctor
grant insert, update, delete on person to doctor;
grant insert, update, delete on patient to doctor;
grant insert, update, delete on address to doctor;
grant insert, update, delete on appointment to doctor;
grant insert, update, delete on reported_side_effect to doctor;

-- show privileges
select * from user_sys_privs;
select * from user_tab_privs;
select * from user_role_privs;

