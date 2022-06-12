SELECT * FROM USER_TABLESPACES;


-- =============USUARIOS Y PASSWORDS =====================
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- *********************GUEST ************************************
CREATE USER guest1 IDENTIFIED BY guest1 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER guest2 IDENTIFIED BY guest2 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER guest3 IDENTIFIED BY guest3 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

SELECT username, default_tablespace, profile, authentication_type
FROM dba_users WHERE account_status = 'OPEN';
-- ********************* MESAS **********************************
CREATE USER mesas1 IDENTIFIED BY mesas1 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER mesas2 IDENTIFIED BY mesas2 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER mesas3 IDENTIFIED BY mesas3 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER mesas4 IDENTIFIED BY mesas4 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;
SELECT username, default_tablespace, profile, authentication_type
FROM dba_users
WHERE account_status = 'OPEN' ORDER BY username;
-- ********************* IT ************************************
CREATE USER it1 IDENTIFIED BY it1 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER it2 IDENTIFIED BY it2 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER it3 IDENTIFIED BY it3 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

SELECT username, default_tablespace, profile, authentication_type
FROM dba_users
WHERE account_status = 'OPEN' ORDER BY username;
-- ******************** ADMIN *********************************
CREATE USER admin1 IDENTIFIED BY admin1 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

CREATE USER admin2 IDENTIFIED BY admin2 DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;

SELECT username, default_tablespace, profile, authentication_type
FROM dba_users
WHERE account_status = 'OPEN' ORDER BY username;



-- ========================= PERMISOS ============================
-- !!!!!! PARA QUE PUEDAN INICIAR SESION !!!!!!!!!!!!!
GRANT CREATE SESSION TO guest1;
GRANT CREATE SESSION TO guest2;
GRANT CREATE SESSION TO guest3;
GRANT CREATE SESSION TO mesas1;
GRANT CREATE SESSION TO mesas2;
GRANT CREATE SESSION TO mesas3;
GRANT CREATE SESSION TO mesas4;
GRANT CREATE SESSION TO it1;
GRANT CREATE SESSION TO it2;
GRANT CREATE SESSION TO it3;
GRANT CREATE SESSION TO admin1;
GRANT CREATE SESSION TO admin2;

-- *********************GUEST ************************************

-- &&&&&&&&&&&&&&&&&&&&&& GUEST1&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT on ACTA TO guest1;
GRANT SELECT on DEPARTAMENTO TO guest1;
GRANT SELECT on ELECCION TO guest1;
GRANT SELECT on MUNICIPIO TO guest1;
GRANT SELECT on PARTIDO TO guest1;
GRANT SELECT on VOTO TO guest1;

-- &&&&&&&&&&&&&&&&&&&&&& GUEST2 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT on ACTA TO guest2;
GRANT SELECT on DEPARTAMENTO TO guest2;
GRANT SELECT on ELECCION TO guest2;
GRANT SELECT on MUNICIPIO TO guest2;
GRANT SELECT on PARTIDO TO guest2;
GRANT SELECT on VOTO TO guest2;

-- &&&&&&&&&&&&&&&&&&&&&& GUEST3 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT on ACTA TO guest3;
GRANT SELECT on DEPARTAMENTO TO guest3;
GRANT SELECT on ELECCION TO guest3;
GRANT SELECT on MUNICIPIO TO guest3;
GRANT SELECT on PARTIDO TO guest3;
GRANT SELECT on VOTO TO guest3;

-- ********************* MESAS **********************************

-- &&&&&&&&&&&&&&&&&&&&&& MESAS1 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO mesas1;
GRANT INSERT ANY TABLE TO mesas1;

-- &&&&&&&&&&&&&&&&&&&&&& MESAS2 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO mesas2;
GRANT INSERT ANY TABLE TO mesas2;

-- &&&&&&&&&&&&&&&&&&&&&& MESAS3 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO mesas3;
GRANT INSERT ANY TABLE TO mesas3;

-- &&&&&&&&&&&&&&&&&&&&&& MESAS1 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO mesas4;
GRANT INSERT ANY TABLE TO mesas4;

-- ********************* IT ************************************
-- &&&&&&&&&&&&&&&&&&&&&& IT1 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO it1 ;
GRANT CREATE ANY TABLE TO it1;
GRANT CREATE USER TO it1;

-- &&&&&&&&&&&&&&&&&&&&&& IT2 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO it2 ;
GRANT CREATE ANY TABLE TO it2;
GRANT CREATE USER TO it2;

-- &&&&&&&&&&&&&&&&&&&&&& IT3 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT SELECT ANY TABLE TO it3 ;
GRANT CREATE ANY TABLE TO it3;
GRANT CREATE USER TO it3;

-- ******************** ADMIN *********************************
-- &&&&&&&&&&&&&&&&&&&&&& ADMIN1 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT UPDATE ANY TABLE TO admin1;
GRANT INSERT ANY TABLE TO admin1 ;
GRANT SELECT ANY TABLE TO admin1 ;
GRANT DELETE ANY TABLE TO admin1;
GRANT CREATE USER TO admin1;

-- &&&&&&&&&&&&&&&&&&&&&& ADMIN2 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
GRANT UPDATE ANY TABLE TO admin2;
GRANT INSERT ANY TABLE TO admin2 ;
GRANT SELECT ANY TABLE TO admin2 ;
GRANT DELETE ANY TABLE TO admin2;
GRANT CREATE USER TO admin2;

SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE like 'IT%' OR GRANTEE like 'MESA%'
   or GRANTEE like 'ADMIN%' or GRANTEE like 'GUEST%'
ORDER BY  GRANTEE;




