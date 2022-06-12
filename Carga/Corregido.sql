CREATE TABLE DEPARTAMENTO(
	CODIGO_DEPTO NUMBER NOT NULL,
	NOMBRE_DEPTO VARCHAR(100),
	CONSTRAINT DEPTA_PK PRIMARY KEY (CODIGO_DEPTO)
) TABLESPACE ELECCIONESTBS ;

-- DROP TABLE DEPARTAMENTO ;

SELECT  * FROM DEPARTAMENTO ;

CREATE TABLE MUNICIPIO(
	CODIGO_MUNI NUMBER NOT NULL,
	DEPTO_MUNI NUMBER NOT NULL,
	NOMBRE_MUNI VARCHAR(100),
	CONSTRAINT MUNI_PK PRIMARY KEY (CODIGO_MUNI, DEPTO_MUNI),
	CONSTRAINT DEPTO_MUNI_FK
    FOREIGN KEY (DEPTO_MUNI)
    REFERENCES DEPARTAMENTO(CODIGO_DEPTO)
) TABLESPACE ELECCIONESTBS;

-- DROP TABLE MUNICIPIO;

SELECT  * FROM MUNICIPIO ;

CREATE TABLE PARTIDO(
	CODIGO_PART NUMBER NOT NULL,
	NOMBRE_PART VARCHAR(100),
	CONSTRAINT PART_PK PRIMARY KEY (CODIGO_PART)
) TABLESPACE ELECCIONESTBS;

-- DROP TABLE PARTIDO;

SELECT * FROM PARTIDO;

CREATE  TABLE ELECCION(
	CODIGO_ELE NUMBER NOT NULL,
	NOMBRE_ELE VARCHAR(100),
	CONSTRAINT ELE_PK PRIMARY KEY (CODIGO_ELE)
) TABLESPACE ELECCIONESTBS;

-- DROP TABLE ELECCION;

SELECT  * FROM ELECCION ;

CREATE TABLE ACTA(
	NUMERO_MESA NUMBER NOT NULL,
	TIPO_ELECCION NUMBER NOT NULL,
	DEPARTAMENTO NUMBER NOT NULL,
	MUNICIPIO NUMBER NOT NULL,
	PAPELETAS_RECIBIDAS NUMBER,
	TOTAL_VOTOS_VALIDOS NUMBER,
	VOTOS_NULOS NUMBER,
	VOTOS_BLANCO NUMBER,
	VOTOS_VALIDOS_EMITIDOS  NUMBER,
	VOTOS_INVALIDOS NUMBER,
	IMAGEN BLOB,
	ESTADO_IMAGEN VARCHAR(3), -- VAL, ANU, ACT
	CUADRA_ACTA VARCHAR(1), -- S o N
	CONTEO_IMPUGNA NUMBER,
	CONTEO_INSCRITOS NUMBER,
	STACTA VARCHAR(3), -- VAL, ANU, ACT
	STESCAN VARCHAR(3),
	STSFISIC VARCHAR(3),
	STSTRANS VARCHAR(3),
	CONSTRAINT ACTA_PK PRIMARY KEY (NUMERO_MESA, TIPO_ELECCION),

	CONSTRAINT DEPTO_ACTA_FK
    FOREIGN KEY (DEPARTAMENTO, MUNICIPIO)
    REFERENCES MUNICIPIO(DEPTO_MUNI, CODIGO_MUNI),

	CONSTRAINT ELE_ACTA_FK
    FOREIGN KEY (TIPO_ELECCION)
    REFERENCES ELECCION(CODIGO_ELE)

) TABLESPACE ELECCIONESTBS;

-- DROP TABLE ACTA;

SELECT  * FROM ACTA;

CREATE TABLE VOTO(
	VOTO_PARTIDO NUMBER NOT NULL,
	VOTO_MESA NUMBER NOT NULL,
	VOTO_ELECCION NUMBER NOT NULL,
	VOTO_CANTIDAD NUMBER,
	CONSTRAINT VOTO_PK PRIMARY KEY (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION),

	CONSTRAINT PARTIDO_VOTO_FK
    FOREIGN KEY (VOTO_PARTIDO)
    REFERENCES PARTIDO(CODIGO_PART),

	CONSTRAINT ACTA_VOTO_FK
    FOREIGN KEY (VOTO_MESA, VOTO_ELECCION)
    REFERENCES ACTA(NUMERO_MESA, TIPO_ELECCION)
) TABLESPACE ELECCIONESTBS;

-- DROP TABLE VOTO:

SELECT * FROM ACTA;



-- ************************************* DATA

--INSERCION DE DATOS PARA LAS TABLAS
INSERT INTO DEPARTAMENTO (CODIGO_DEPTO, NOMBRE_DEPTO) VALUES(1,'Guatemala');
INSERT INTO DEPARTAMENTO (CODIGO_DEPTO, NOMBRE_DEPTO) VALUES(2,'Quetzaltenango');
INSERT INTO DEPARTAMENTO (CODIGO_DEPTO, NOMBRE_DEPTO) VALUES(3,'Alta Verapaz');
INSERT INTO DEPARTAMENTO (CODIGO_DEPTO, NOMBRE_DEPTO) VALUES(4,'Chimaltenango');
INSERT INTO DEPARTAMENTO (CODIGO_DEPTO, NOMBRE_DEPTO) VALUES(5,'Escuintla');

INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(1,1,'Guatemala');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(2,1,'Villa Canales');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(3,1,'Palencia');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(4,1,'San Miguel Petapa');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(5,1,'San Jose Pinula');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(6,2,'Quetzaltenango');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(7,2,'Olintepeque');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(8,2,'Zunil');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(9,2,'La Esperanza');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(10,2,'Coban');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(11,3,'Tactic');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(12,3,'Chisec');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(13,3,'Panzoz');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(14,3,'San Pedro Carcha');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(15,3,'Fray Bartolome de las Cases');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(16,4,'Chimaltenango');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(17,4,'Tecpan');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(18,4,'El Tejar');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(19,4,'Patzicia');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(20,4,'Zaragoza');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(21,5,'Escuintla');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(22,5,'Iztapa');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(23,5,'Palin');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(24,5,'Santa Lucia Cotzumalguapa');
INSERT INTO MUNICIPIO (CODIGO_MUNI, DEPTO_MUNI, NOMBRE_MUNI) VALUES(25,5,'La Democracia');

INSERT INTO PARTIDO (CODIGO_PART, NOMBRE_PART) VALUES(1,'Vamos');
INSERT INTO PARTIDO (CODIGO_PART, NOMBRE_PART) VALUES(2,'Todos');
INSERT INTO PARTIDO (CODIGO_PART, NOMBRE_PART) VALUES(3,'Pan');
INSERT INTO PARTIDO (CODIGO_PART, NOMBRE_PART) VALUES(4,'FRG');
INSERT INTO PARTIDO (CODIGO_PART, NOMBRE_PART) VALUES(5,'Mas');

INSERT INTO ELECCION (CODIGO_ELE, NOMBRE_ELE) VALUES(1,'Presidente');
INSERT INTO ELECCION (CODIGO_ELE, NOMBRE_ELE) VALUES(2,'Alcalde');

--ACTAS PRESIDENTE
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(1,1,1,1,107,100,5,2,100,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(2,1,1,2,153,150,1,2,150,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(3,1,1,3,105,102,2,0,102,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(4,1,1,4,91,90,0,1,91,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(5,1,1,5,123,122,0,0,122,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(6,1,2,6,110,101,6,3,101,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(7,1,2,7,157,151,2,3,151,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(8,1,2,8,108,103,3,1,103,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(9,1,2,9,91,91,0,1,91,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(10,1,2,10,124,123,0,0,123,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(11,1,3,11,111,101,6,4,101,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(12,1,3,12,158,151,3,3,151,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(13,1,3,13,109,103,3,1,103,2);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(14,1,3,14,56,25,0,1,25,29);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(15,1,3,15,45,40,5,0,40,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(16,1,4,16,35,30,5,0,30,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(17,1,4,17,75,50,20,5,50,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(18,1,4,18,66,63,3,0,63,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(19,1,4,19,56,25,0,0,25,31);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(20,1,4,20,44,40,4,0,44,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(21,1,5,21,36,31,5,0,30,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(22,1,5,22,76,51,20,5,51,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(23,1,5,23,67,64,3,0,64,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(24,1,5,24,55,25,0,0,25,30);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(25,1,5,25,45,40,5,0,44,0);

--ACTAS ALCALDE
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(26,2,1,1,107,100,5,2,100,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(27,2,1,2,153,150,1,2,150,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(28,2,1,3,105,102,2,0,102,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(29,2,1,4,91,90,0,1,91,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(30,2,1,5,123,122,0,0,122,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(31,2,2,6,110,101,6,3,101,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(32,2,2,7,157,151,2,3,151,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(33,2,2,8,108,103,3,1,103,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(34,2,2,9,91,91,0,1,91,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(35,2,2,10,124,123,0,0,123,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(36,2,3,11,111,101,6,4,101,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(37,2,3,12,158,151,3,3,151,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(38,2,3,13,109,103,3,1,103,2);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(39,2,3,14,56,25,0,1,25,29);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(40,2,3,15,45,40,5,0,40,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(41,2,4,16,35,30,5,0,30,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(42,2,4,17,75,50,20,5,50,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(43,2,4,18,66,63,3,0,63,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(44,2,4,19,56,25,0,0,25,31);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(45,2,4,20,44,40,4,0,44,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(46,2,5,21,36,31,5,0,30,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(47,2,5,22,76,51,20,5,51,1);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(48,2,5,23,67,64,3,0,64,0);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(49,2,5,24,55,25,0,0,25,30);
INSERT INTO ACTA (NUMERO_MESA, TIPO_ELECCION, DEPARTAMENTO, MUNICIPIO, PAPELETAS_RECIBIDAS, TOTAL_VOTOS_VALIDOS, VOTOS_NULOS, VOTOS_BLANCO, VOTOS_VALIDOS_EMITIDOS, VOTOS_INVALIDOS) VALUES(50,2,5,25,45,40,5,0,44,0);


--VOTOS PRESIDENTE
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,1,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,1,1,34);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,1,1,22);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,1,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,1,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,2,1,22);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,2,1,13);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,2,1,12);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,2,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,2,1,13);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,3,1,21);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,3,1,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,3,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,3,1,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,3,1,33);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,4,1,27);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,4,1,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,4,1,26);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,4,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,4,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,5,1,16);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,5,1,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,5,1,35);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,5,1,66);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,5,1,1);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,6,1,12);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,6,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,6,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,6,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,6,1,17);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,7,1,21);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,7,1,33);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,7,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,7,1,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,7,1,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,8,1,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,8,1,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,8,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,8,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,8,1,14);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,9,1,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,9,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,9,1,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,9,1,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,9,1,13);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,10,1,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,10,1,27);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,10,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,10,1,16);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,10,1,12);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,11,1,32);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,11,1,17);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,11,1,32);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,11,1,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,11,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,12,1,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,12,1,35);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,12,1,12);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,12,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,12,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,13,1,18);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,13,1,17);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,13,1,51);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,13,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,13,1,24);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,14,1,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,14,1,18);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,14,1,16);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,14,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,14,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,15,1,61);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,15,1,17);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,15,1,35);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,15,1,26);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,15,1,2);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,16,1,12);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,16,1,27);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,16,1,33);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,16,1,21);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,16,1,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,17,1,32);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,17,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,17,1,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,17,1,35);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,17,1,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,18,1,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,18,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,18,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,18,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,18,1,4);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,19,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,19,1,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,19,1,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,19,1,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,19,1,12);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,20,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,20,1,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,20,1,31);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,20,1,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,20,1,21);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,21,1,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,21,1,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,21,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,21,1,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,21,1,18);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,22,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,22,1,52);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,22,1,27);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,22,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,22,1,19);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,23,1,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,23,1,9);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,23,1,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,23,1,9);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,23,1,41);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,24,1,55);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,24,1,28);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,24,1,16);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,24,1,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,24,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,25,1,13);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,25,1,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,25,1,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,25,1,36);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,25,1,51);
--VOTOS ALCALDA


select  NUMERO_MESA, TIPO_ELECCION from ACTA where TIPO_ELECCION=2;
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,26,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,26,2,34);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,26,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,26,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,26,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,27,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,27,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,27,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,27,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,27,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,28,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,28,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,28,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,28,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,28,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,29,2,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,29,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,29,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,29,2,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,29,2,39);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,30,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,30,2,73);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,30,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,30,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,30,2,17);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,31,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,31,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,31,2,34);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,31,2,61);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,31,2,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,32,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,32,2,73);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,32,2,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,32,2,46);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,32,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,33,2,81);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,33,2,57);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,33,2,52);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,33,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,33,2,4);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,34,2,73);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,34,2,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,34,2,62);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,34,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,34,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,35,2,61);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,35,2,72);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,35,2,55);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,35,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,35,2,2);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,36,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,36,2,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,36,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,36,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,36,2,19);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,37,2,27);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,37,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,37,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,37,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,37,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,38,2,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,38,2,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,38,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,38,2,45);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,38,2,4);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,39,2,48);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,39,2,68);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,39,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,39,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,39,2,18);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,40,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,40,2,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,40,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,40,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,40,2,23);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,41,2,42);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,41,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,41,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,41,2,21);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,41,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,42,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,42,2,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,42,2,24);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,42,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,42,2,1);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,43,2,81);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,43,2,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,43,2,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,43,2,15);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,43,2,41);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,44,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,44,2,28);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,44,2,63);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,44,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,44,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,45,2,11);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,45,2,47);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,45,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,45,2,26);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,45,2,1);

INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,46,2,23);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,46,2,25);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,46,2,36);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,46,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,46,2,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,47,2,36);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,47,2,2);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,47,2,7);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,47,2,43);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,47,2,9);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,48,2,38);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,48,2,91);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,48,2,34);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,48,2,92);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,48,2,4);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,49,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,49,2,8);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,49,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,49,2,5);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,49,2,19);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(1,50,2,3);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(2,50,2,71);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(3,50,2,18);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(4,50,2,6);
INSERT INTO VOTO (VOTO_PARTIDO, VOTO_MESA, VOTO_ELECCION, VOTO_CANTIDAD) VALUES(5,50,2,5);