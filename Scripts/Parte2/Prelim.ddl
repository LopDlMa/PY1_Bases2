-- Generado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   en:        2022-06-05 23:38:45 CST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE equipo (
    equipo INTEGER NOT NULL,
    nombre CHAR(300 CHAR) NOT NULL
);

ALTER TABLE equipo ADD CONSTRAINT equipo_pk PRIMARY KEY ( equipo );

CREATE TABLE jornada (
    jornada   INTEGER NOT NULL,
    numero    INTEGER NOT NULL,
    liga_liga INTEGER NOT NULL
);

ALTER TABLE jornada ADD CONSTRAINT jornada_pk PRIMARY KEY ( jornada,
                                                            liga_liga );

CREATE TABLE jugador (
    jugador       INTEGER NOT NULL,
    nombre        VARCHAR2(300 CHAR) NOT NULL,
    goles         INTEGER NOT NULL,
    equipo_equipo INTEGER NOT NULL
);

ALTER TABLE jugador ADD CONSTRAINT jugador_pk PRIMARY KEY ( jugador,
                                                            equipo_equipo );

CREATE TABLE liga (
    liga         INTEGER NOT NULL,
    nombre       VARCHAR2(250 CHAR) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin    DATE NOT NULL
);

ALTER TABLE liga ADD CONSTRAINT liga_pk PRIMARY KEY ( liga );

CREATE TABLE partido (
    partido           INTEGER NOT NULL,
    fecha             DATE NOT NULL,
    goles_local       INTEGER NOT NULL,
    goles_visita      INTEGER NOT NULL,
    jornada_jornada   INTEGER NOT NULL,
    jornada_liga_liga INTEGER NOT NULL,
    equipo_equipo     INTEGER NOT NULL,
    equipo_equipo2    INTEGER NOT NULL
);

ALTER TABLE partido
    ADD CONSTRAINT partido_pk PRIMARY KEY ( partido,
                                            jornada_jornada,
                                            jornada_liga_liga,
                                            equipo_equipo,
                                            equipo_equipo2 );

ALTER TABLE jornada
    ADD CONSTRAINT jornada_liga_fk FOREIGN KEY ( liga_liga )
        REFERENCES liga ( liga );

ALTER TABLE jugador
    ADD CONSTRAINT jugador_equipo_fk FOREIGN KEY ( equipo_equipo )
        REFERENCES equipo ( equipo );

ALTER TABLE partido
    ADD CONSTRAINT partido_equipo_fk FOREIGN KEY ( equipo_equipo )
        REFERENCES equipo ( equipo );

ALTER TABLE partido
    ADD CONSTRAINT partido_equipo_fkv2 FOREIGN KEY ( equipo_equipo2 )
        REFERENCES equipo ( equipo );

ALTER TABLE partido
    ADD CONSTRAINT partido_jornada_fk FOREIGN KEY ( jornada_jornada,
                                                    jornada_liga_liga )
        REFERENCES jornada ( jornada,
                             liga_liga );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
