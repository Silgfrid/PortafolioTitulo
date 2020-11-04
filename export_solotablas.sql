CREATE TABLE "CLIENTE"
   (	"ID_CLIENTE" NUMBER(*,0),
	"RUT_CLIENTE" NUMBER(8,0),
	"DV_CLIENTE" VARCHAR2(255 BYTE),
	"RAZON_SOCIAL" VARCHAR2(255 BYTE),
	"TIPO_CONTRATO" NUMBER(1,0),
	"STATUS_CLIENTE" NUMBER(1,0)
   );

ALTER TABLE "CLIENTE" ADD CONSTRAINT "CLIENTE_PK" PRIMARY KEY ("ID_CLIENTE");

CREATE SEQUENCE "CLIENTE_SEQ1"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 1 CACHE 20;

CREATE OR REPLACE TRIGGER "CLIENTE_TRG"
    BEFORE INSERT ON CLIENTE
    FOR EACH ROW
BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
        IF INSERTING AND :NEW.ID_CLIENTE IS NULL THEN
            SELECT CLIENTE_SEQ1.NEXTVAL INTO :NEW.ID_CLIENTE FROM SYS.DUAL;
        END IF;
    END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CLIENTE_TRG" ENABLE;

CREATE TABLE "PROFESIONAL"
(	"ID_PROFESIONAL" NUMBER(*,0),
     "RUT_PROFESIONAL" VARCHAR2(8 BYTE),
     "DV_RUT_PROFESIONAL" VARCHAR2(1 BYTE),
     "NOMBRES_PROFESIONAL" VARCHAR2(255 BYTE),
     "AP_PATERNO_PROF" VARCHAR2(255 BYTE),
     "AP_MATERNO_PROF" VARCHAR2(255 BYTE),
     "FEC_INGRESO_PROF" DATE
);
ALTER TABLE "PROFESIONAL" ADD CONSTRAINT "PROFESIONAL_PK" PRIMARY KEY ("ID_PROFESIONAL");

CREATE SEQUENCE  "PROFESIONAL_SEQ"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ;


CREATE OR REPLACE TRIGGER "PROFESIONAL_TRG"
    BEFORE INSERT ON PROFESIONAL
    FOR EACH ROW
BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
        IF INSERTING AND :NEW.ID_PROFESIONAL IS NULL THEN
            SELECT PROFESIONAL_SEQ.NEXTVAL INTO :NEW.ID_PROFESIONAL FROM SYS.DUAL;
        END IF;
    END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "PROFESIONAL_TRG" ENABLE;