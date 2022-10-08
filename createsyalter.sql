CREATE TABLE TELEFONOS_P(
    ID_TELEFONO INT,
    RUT INT,
    ID_NUMERO INT
    );

CREATE TABLE TELEFONOS_B(
    ID_TELEFONO INT,
    BASE INT,
    ID_NUMERO INT
    );
    
CREATE TABLE NUM_TELEFONOS(
    ID_NUMERO INT,
    NUMERO INT
    );

CREATE TABLE BASES(
    CODIGO_BASE INT,
    NOMBRE VARCHAR2(100),
    ID_DIRECCION INT
    );

CREATE TABLE DIRECCION(
    ID_DIRECCION INT,
    CODIGO_DIRECCION VARCHAR2(100),
    REGION VARCHAR2(100),
    CIUDAD VARCHAR2(100),
    CALLE VARCHAR2(100),
    NUMERO INT,
    CODIGO_POSTAL INT
    );
    
CREATE TABLE PERSONAL(
    RUT INT,
    NOMBRE VARCHAR2(100),
    APELLIDO VARCHAR2(100),
    EDAD INT,
    F_NACIMIENTO DATE,
    A�OS_S INT,
    ID_RANGO INT,
    ID_CODIGO_BASE INT,
    ID_DIRECCION INT);
    
CREATE TABLE ESPECIALIDADES(
   ID_ESPECIALIDADES INT,
   RUT INT,
   ID_ESPECIALIDAD INT
   );
   
CREATE TABLE ESPECIALIDAD(
   ID_ESPECIALIDAD INT,
   NIVEL INT,
   NOMBRE_ESPECIALIDAD VARCHAR2(100)
   );
   
CREATE  TABLE ARMAMENTO(
    ID_ARMAMENTO INT,
    SERIAL VARCHAR2(200),
    TIPO INT,
    PELIGROSIDAD VARCHAR2(200),
    CALIBRE INT,
    PESO INT
    );

CREATE TABLE ACCESORIOS(
    C�DIGO_ACCESORIO INT,
    NOMBRE VARCHAR2(200),
    INDICACIONES INT
    );
    
CREATE TABLE ARSENAL(
    ID_ARSENAL INT,
    ID_EQUIPO INT,
    ID_ARMAMENTO INT
    );

CREATE TABLE ALTO_MANDO(
ID_ALTO_MANDO NUMBER NOT NULL, --PK
NOMBRE_ALTO_MANDO VARCHAR2(100),
NOMBRE_UNIDAD VARCHAR2(100),
CARGO VARCHAR2(100),
ID_RANGO INT
);
/
CREATE TABLE RANGOS(
ID_RANGO NUMBER NOT NULL, --PK
TITULO VARCHAR2(100),
DESCRIPCION VARCHAR2(100)
);
/
CREATE TABLE SUBORDINADOS(
ID_SUBORDINADO NUMBER NOT NULL, --PK
NOMBRE_SUBORDINADO VARCHAR2(100), 
NOMBRE_SUPERIOR VARCHAR2(100), 
APUNTE_MEDICO VARCHAR2(100), 
CODIGO_EQUIPO NUMBER,
ID_ALTO_MANDO NUMBER NOT NULL, --FK
ID_RANGO NUMBER NOT NULL --FK
);

CREATE TABLE EQUIPO(
ID_EQUIPO NUMBER NOT NULL, --PK
NOMBRE_EQUIPO VARCHAR2(100),
CODIGO_ACCESORIO NUMBER
);

ALTER TABLE NUM_TELEFONOS ADD CONSTRAINT PK_NUM_TELEFONOS PRIMARY KEY(ID_NUMERO);
ALTER TABLE TELEFONOS_P ADD CONSTRAINT PK_TELEFONOS_P PRIMARY KEY(ID_TELEFONO);
ALTER TABLE TELEFONOS_B ADD CONSTRAINT PK_TELEFONOS_B PRIMARY KEY(ID_TELEFONO);
ALTER TABLE DIRECCION ADD CONSTRAINT PK_DIRECCION PRIMARY KEY(ID_DIRECCION);
ALTER TABLE BASES ADD CONSTRAINT PK_BASES PRIMARY KEY(CODIGO_BASE);
ALTER TABLE PERSONAL ADD CONSTRAINT PK_PERSONAL PRIMARY KEY(RUT);
ALTER TABLE ALTO_MANDO ADD CONSTRAINT PK_ID_ALTO_MANDO PRIMARY KEY(ID_ALTO_MANDO);
ALTER TABLE RANGOS ADD CONSTRAINT PK_ID_RANGO PRIMARY KEY(ID_RANGO);
ALTER TABLE SUBORDINADOS ADD CONSTRAINT PK_ID_SUBORDINADO PRIMARY KEY(ID_SUBORDINADO);
ALTER TABLE EQUIPO ADD CONSTRAINT PK_ID_EQUIPO PRIMARY KEY(ID_EQUIPO);
ALTER TABLE ARMAMENTO ADD CONSTRAINT PK_ID_ARMAMENTO PRIMARY KEY(ID_ARMAMENTO);
ALTER TABLE ACCESORIOS ADD CONSTRAINT PK_CODIGO_ACCESORIO PRIMARY KEY(C�DIGO_ACCESORIO);
ALTER TABLE ARSENAL ADD CONSTRAINT PK_ID_ARSENAL PRIMARY KEY(ID_ARSENAL);
ALTER TABLE ESPECIALIDAD ADD CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY(ID_ESPECIALIDAD);    
ALTER TABLE ESPECIALIDADES ADD CONSTRAINT PK_ESPECIALIDADES PRIMARY KEY(ID_ESPECIALIDADES);    


ALTER TABLE BASES ADD CONSTRAINT FK_BASES_DIRECCION FOREIGN KEY (ID_DIRECCION) REFERENCES DIRECCION(ID_DIRECCION);
ALTER TABLE TELEFONOS_B ADD CONSTRAINT FK_BASES_TELEFONO FOREIGN KEY (BASE) REFERENCES BASES(CODIGO_BASE);
ALTER TABLE TELEFONOS_P ADD CONSTRAINT FK__TELEFONO_PERS FOREIGN KEY (RUT) REFERENCES PERSONAL(RUT);
ALTER TABLE ESPECIALIDADES ADD CONSTRAINT FK_PERSONAL_ESPECIALIDADES FOREIGN KEY (RUT) REFERENCES PERSONAL(RUT);
ALTER TABLE PERSONAL ADD CONSTRAINT FK_PERSONAL_RANGO FOREIGN KEY (ID_RANGO) REFERENCES RANGOS(ID_RANGO);
ALTER TABLE PERSONAL ADD CONSTRAINT FK_PERSONAL_BASES FOREIGN KEY (ID_CODIGO_BASE) REFERENCES BASES(CODIGO_BASE);
ALTER TABLE PERSONAL ADD CONSTRAINT FK_PERSONAL_DIRECCION FOREIGN KEY (ID_DIRECCION) REFERENCES DIRECCION(ID_DIRECCION);
ALTER TABLE TELEFONOS_P ADD CONSTRAINT FK_TELEFONOS_P_NUMEROS FOREIGN KEY (ID_NUMERO) REFERENCES NUM_TELEFONOS(ID_NUMERO);
ALTER TABLE TELEFONOS_B ADD CONSTRAINT FK_TELEFONOS_B_NUMEROS FOREIGN KEY (ID_NUMERO) REFERENCES NUM_TELEFONOS(ID_NUMERO);
ALTER TABLE SUBORDINADOS ADD CONSTRAINT FK_ID_ALTO_MANDO_SUB FOREIGN KEY(ID_ALTO_MANDO) REFERENCES ALTO_MANDO(ID_ALTO_MANDO); 
ALTER TABLE SUBORDINADOS ADD CONSTRAINT FK_ID_RANGO_SUB FOREIGN KEY(ID_RANGO) REFERENCES RANGOS(ID_RANGO);
ALTER TABLE SUBORDINADOS ADD CONSTRAINT FK_SUB_EQUIPO FOREIGN KEY(CODIGO_EQUIPO) REFERENCES EQUIPO(ID_EQUIPO);
ALTER TABLE ARSENAL ADD CONSTRAINT FK_ID_ARSENAL FOREIGN KEY(ID_EQUIPO) REFERENCES EQUIPO(ID_EQUIPO);
ALTER TABLE EQUIPO ADD CONSTRAINT FK_EQUI_ACCES FOREIGN KEY(CODIGO_ACCESORIO) REFERENCES ACCESORIOS(C�DIGO_ACCESORIO);
ALTER TABLE ARSENAL ADD CONSTRAINT FK_ARSENAL_ARMAMENTO FOREIGN KEY(ID_ARMAMENTO) REFERENCES ARMAMENTO(ID_ARMAMENTO);
ALTER TABLE ALTO_MANDO ADD CONSTRAINT FK_ALTO_RANGO FOREIGN KEY(ID_RANGO) REFERENCES RANGOS(ID_RANGO);
ALTER TABLE ESPECIALIDADES ADD CONSTRAINT FK_ESPE_ESPE FOREIGN KEY(ID_ESPECIALIDAD) REFERENCES ESPECIALIDAD(ID_ESPECIALIDAD);






