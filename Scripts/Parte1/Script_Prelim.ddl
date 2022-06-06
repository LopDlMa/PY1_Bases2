-- Generado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   en:        2022-06-05 22:45:51 CST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE acta (
    numero_mesa                         INTEGER NOT NULL,
    eleccion_codigo_ele                 INTEGER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    municipio_departamento_codigo_depto INTEGER NOT NULL,
    municipio_codigo_muni               INTEGER NOT NULL,
    papeleras_recibidas                 INTEGER NOT NULL,
    total_votos_validos                 INTEGER NOT NULL,
    votos_nulos                         INTEGER NOT NULL,
    votos_blancos                       INTEGER NOT NULL,
    votos_validos_emitidos              INTEGER NOT NULL,
    votos_invalidos                     INTEGER NOT NULL,
    imagen                              VARCHAR2(500 CHAR),
    estado_imagen                       VARCHAR2(2 CHAR),
    cuadra_acta                         VARCHAR2(1 CHAR),
    conteo_impugna                      INTEGER,
    conteo_inscritos                    INTEGER,
    stacta                              VARCHAR2(2 CHAR),
    stescan                             VARCHAR2(2 CHAR),
    stfisc                              VARCHAR2(2 CHAR),
    sttrans                             VARCHAR2(2 CHAR)
);

ALTER TABLE acta
    ADD CONSTRAINT acta_pk PRIMARY KEY ( numero_mesa,
                                         municipio_codigo_muni,
                                         municipio_departamento_codigo_depto,
                                         eleccion_codigo_ele );

CREATE TABLE departamento (
    codigo_depto INTEGER NOT NULL,
    nombre_depto VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( codigo_depto );

CREATE TABLE eleccion (
    codigo_ele INTEGER NOT NULL,
    nombre_ele VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE eleccion ADD CONSTRAINT eleccion_pk PRIMARY KEY ( codigo_ele );

CREATE TABLE municipio (
    codigo_muni               INTEGER NOT NULL,
    departamento_codigo_depto INTEGER NOT NULL,
    nombre_muni               VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( codigo_muni,
                                                                departamento_codigo_depto );

CREATE TABLE partido (
    codigo_partido INTEGER NOT NULL,
    nombre_part    VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE partido ADD CONSTRAINT partido_pk PRIMARY KEY ( codigo_partido );

CREATE TABLE voto (
    partido_codigo_partido                   INTEGER NOT NULL,
    acta_numero_mesa                         INTEGER NOT NULL,
    acta_municipio_codigo_muni               INTEGER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    acta_municipio_departamento_codigo_depto INTEGER NOT NULL,
    acta_eleccion_codigo_ele                 INTEGER NOT NULL,
    voto_cantidad                            INTEGER
);

ALTER TABLE voto
    ADD CONSTRAINT voto_pk PRIMARY KEY ( partido_codigo_partido,
                                         acta_numero_mesa,
                                         acta_municipio_codigo_muni,
                                         acta_municipio_departamento_codigo_depto,
                                         acta_eleccion_codigo_ele );

ALTER TABLE acta
    ADD CONSTRAINT acta_eleccion_fk FOREIGN KEY ( eleccion_codigo_ele )
        REFERENCES eleccion ( codigo_ele );

ALTER TABLE acta
    ADD CONSTRAINT acta_municipio_fk FOREIGN KEY ( municipio_codigo_muni,
                                                   municipio_departamento_codigo_depto )
        REFERENCES municipio ( codigo_muni,
                               departamento_codigo_depto );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_codigo_depto )
        REFERENCES departamento ( codigo_depto );

ALTER TABLE voto
    ADD CONSTRAINT voto_acta_fk FOREIGN KEY ( acta_numero_mesa,
                                              acta_municipio_codigo_muni,
                                              acta_municipio_departamento_codigo_depto,
                                              acta_eleccion_codigo_ele )
        REFERENCES acta ( numero_mesa,
                          municipio_codigo_muni,
                          municipio_departamento_codigo_depto,
                          eleccion_codigo_ele );

ALTER TABLE voto
    ADD CONSTRAINT voto_partido_fk FOREIGN KEY ( partido_codigo_partido )
        REFERENCES partido ( codigo_partido );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
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
-- ERRORS                                   2
-- WARNINGS                                 0
