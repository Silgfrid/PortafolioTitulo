--------------------------------------------------------
-- Archivo creado  - martes-noviembre-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View MGV_ALL_CATALOGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_CATALOGS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL", "CATALOG_ID", "CATALOG_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_CONNECTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_CONNECTIONS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "CONNECTION_NAME", "HOST", "PORT", "USERNAME", "DBURL") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_SCHEMA
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_SCHEMA" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_STORED_PROGRAMS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_STORED_PROGRAMS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME", "STORED_PROGRAM_ID", "PROGRAMTYPE", "STORED_PROGRAM_NAME", "PACKAGE_ID_FK") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id;
--------------------------------------------------------
--  DDL for View MGV_ALL_TABLES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_TABLES" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME", "TABLE_ID", "TABLE_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_TABLE_TRIGGERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_TABLE_TRIGGERS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "TABLE_ID", "TABLE_NAME", "TRIGGER_ID", "TRIGGER_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id;
--------------------------------------------------------
--  DDL for View MGV_ALL_VIEWS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_VIEWS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "VIEW_ID", "VIEW_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY;

   COMMENT ON TABLE "CRISTIAN_DB"."MGV_ALL_VIEWS"  IS 'View to iterate over all views in the system';
--------------------------------------------------------
--  DDL for View MGV_ALL_VIEW_TRIGGERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CRISTIAN_DB"."MGV_ALL_VIEW_TRIGGERS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "VIEW_ID", "VIEW_NAME", "TRIGGER_ID", "TRIGGER_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."CLIENTE" 
   (	"ID_CLIENTE" NUMBER(*,0), 
	"RUT_CLIENTE" NUMBER(8,0), 
	"DV_CLIENTE" VARCHAR2(255 BYTE), 
	"RAZON_SOCIAL" VARCHAR2(255 BYTE), 
	"TIPO_CONTRATO" NUMBER(1,0), 
	"STATUS_CLIENTE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
  NO INMEMORY ("ID_CLIENTE") ;
--------------------------------------------------------
--  DDL for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"REF_ID_FK" NUMBER, 
	"REF_TYPE" VARCHAR2(4000 BYTE), 
	"PROPERTY_ORDER" NUMBER, 
	"PROP_KEY" VARCHAR2(4000 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."CONNECTION_ID_FK" IS 'Connection to which this belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."REF_ID_FK" IS 'The object to which this property blongs';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."REF_TYPE" IS 'Type of object that this property belongs to';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."PROPERTY_ORDER" IS 'This is to handle a situation where multiple properties have a relevant order, or multiple properties have multiple values';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."PROP_KEY" IS 'The keyname for this property';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"."VALUE" IS 'The value for this property';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES"  IS 'This table is used to store additional properties in key-value pairs.  It is designed to store "other information" that is not supported in the main database object table.';
--------------------------------------------------------
--  DDL for Table MD_APPLICATIONFILES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" 
   (	"ID" NUMBER, 
	"APPLICATIONS_ID_FK" NUMBER, 
	"NAME" VARCHAR2(200 BYTE), 
	"URI" VARCHAR2(4000 BYTE), 
	"TYPE" VARCHAR2(100 BYTE), 
	"STATE" VARCHAR2(100 BYTE), 
	"LANGUAGE" VARCHAR2(100 BYTE), 
	"LOC" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(4000 BYTE), 
	"UPDATED_ON" DATE, 
	"UPDATED_BY" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."NAME" IS 'file name  //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."URI" IS 'The uri is the part of the file url after the base dir has been removed.  See MD_APPLICATION for base dir';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."TYPE" IS 'This will denote the type of file we have, including DIR, FILE (text), BINARY, IGNORE (where we choose to ignore files)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."STATE" IS 'State will be how this file is operated on.  For example. it will be OPEN, NEW, FIXED, IGNORED, REVIEWED, COMPLETE';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."LANGUAGE" IS 'Language of the file that has been processed.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."SECURITY_GROUP_ID" IS 'APEX';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."CREATED_ON" IS 'APEX';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."CREATED_BY" IS 'APEX';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."UPDATED_ON" IS 'APEX';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONFILES"."UPDATED_BY" IS 'APEX';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES"  IS 'Holds a tuple for each file that is being processed whether it is changed or not.';
--------------------------------------------------------
--  DDL for Table MD_APPLICATIONS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_APPLICATIONS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"BASE_DIR" VARCHAR2(4000 BYTE), 
	"OUTPUT_DIR" VARCHAR2(4000 BYTE), 
	"BACKUP_DIR" VARCHAR2(4000 BYTE), 
	"INPLACE" NUMBER, 
	"PROJECT_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."NAME" IS 'Name of the application suite  //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."DESCRIPTION" IS 'Overview of what the application does.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."BASE_DIR" IS 'This is the base src directory for the application.  It could be an svn checkout, a clearcase view or something similar';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."OUTPUT_DIR" IS 'This is the output directory where the scanner will present the converted files, if there are converted or modified.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."BACKUP_DIR" IS 'This is the directory in which the application files are backed up if a backp is chosen';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."INPLACE" IS 'Designates whether the changes have been made inplace, in the source directory or not';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_APPLICATIONS"."PROJECT_ID_FK" IS 'project of the database(s) this application relates to';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_APPLICATIONS"  IS 'This is the base table for application projects.  It holds the base information for applications associated with a database';
--------------------------------------------------------
--  DDL for Table MD_CATALOGS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_CATALOGS" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"CATALOG_NAME" VARCHAR2(4000 BYTE), 
	"DUMMY_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CATALOGS"."CONNECTION_ID_FK" IS 'Foreign key into the connections table - Shows what connection this catalog belongs to //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CATALOGS"."CATALOG_NAME" IS 'Name of the catalog //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CATALOGS"."DUMMY_FLAG" IS 'Flag to show if this catalog is a "dummy" catalog which is used as a placeholder for those platforms that do not support catalogs.  ''N'' signifies that this is NOT a dummy catalog, while ''Y'' signifies that it is.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CATALOGS"."NATIVE_SQL" IS 'THe SQL used to create this catalog';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CATALOGS"."NATIVE_KEY" IS 'A unique identifier used to identify the catalog at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_CATALOGS"  IS 'Store catalogs in this table.';
--------------------------------------------------------
--  DDL for Table MD_CODE_REGEX
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_CODE_REGEX" 
   (	"ID" NUMBER, 
	"REGEX" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CODE_REGEX"."ID" IS 'ID of regex for searching source code';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CODE_REGEX"."REGEX" IS 'Regex to use in reports of artifiacts in code.  This will be used for customers to analyze what is in their code.';
--------------------------------------------------------
--  DDL for Table MD_COLUMNS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_COLUMNS" 
   (	"ID" NUMBER, 
	"TABLE_ID_FK" NUMBER, 
	"COLUMN_NAME" VARCHAR2(4000 BYTE), 
	"COLUMN_ORDER" NUMBER, 
	"COLUMN_TYPE" VARCHAR2(4000 BYTE), 
	"PRECISION" NUMBER, 
	"SCALE" NUMBER, 
	"NULLABLE" CHAR(1 BYTE), 
	"DEFAULT_VALUE" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"DATATYPE_TRANSFORMED_FLAG" CHAR(1 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."TABLE_ID_FK" IS 'The table that this column is part of //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."COLUMN_NAME" IS 'The name of the column //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."COLUMN_ORDER" IS 'The order this appears in the table';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."COLUMN_TYPE" IS 'The type of the column';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."PRECISION" IS 'The precision on the column';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."SCALE" IS 'The scale of the column';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."NULLABLE" IS 'Yes or No.  Null signifies NO';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."DEFAULT_VALUE" IS 'Default value on the column';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."NATIVE_SQL" IS 'The SQL used to create this column at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."NATIVE_KEY" IS 'Unique identifier for this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_COLUMNS"."DATATYPE_TRANSFORMED_FLAG" IS 'This is set to ''Y'' to show if the data type was transformed.  This is useful so we don''t apply more than 1 datatype transformation to a column';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_COLUMNS"  IS 'Column information is stored in this table.';
--------------------------------------------------------
--  DDL for Table MD_CONNECTIONS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_CONNECTIONS" 
   (	"ID" NUMBER, 
	"PROJECT_ID_FK" NUMBER, 
	"TYPE" VARCHAR2(4000 BYTE), 
	"HOST" VARCHAR2(4000 BYTE), 
	"PORT" NUMBER, 
	"USERNAME" VARCHAR2(4000 BYTE), 
	"PASSWORD" VARCHAR2(4000 BYTE), 
	"DBURL" VARCHAR2(4000 BYTE), 
	"NAME" VARCHAR2(255 BYTE), 
	"NATIVE_SQL" CLOB, 
	"STATUS" VARCHAR2(30 BYTE), 
	"NUM_CATALOGS" NUMBER, 
	"NUM_COLUMNS" NUMBER, 
	"NUM_CONSTRAINTS" NUMBER, 
	"NUM_GROUPS" NUMBER, 
	"NUM_ROLES" NUMBER, 
	"NUM_INDEXES" NUMBER, 
	"NUM_OTHER_OBJECTS" NUMBER, 
	"NUM_PACKAGES" NUMBER, 
	"NUM_PRIVILEGES" NUMBER, 
	"NUM_SCHEMAS" NUMBER, 
	"NUM_SEQUENCES" NUMBER, 
	"NUM_STORED_PROGRAMS" NUMBER, 
	"NUM_SYNONYMS" NUMBER, 
	"NUM_TABLES" NUMBER, 
	"NUM_TABLESPACES" NUMBER, 
	"NUM_TRIGGERS" NUMBER, 
	"NUM_USER_DEFINED_DATA_TYPES" NUMBER, 
	"NUM_USERS" NUMBER, 
	"NUM_VIEWS" NUMBER, 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."ID" IS 'Primary key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."PROJECT_ID_FK" IS 'The project to which this connection belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."TYPE" IS 'The type of the connection - For example it could be used to store "ORACLE" or "MYSQL"';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."HOST" IS 'The host to which this connection connects.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."PORT" IS 'The port to which this connection connects';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."USERNAME" IS 'The username used to make the connection';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."PASSWORD" IS 'The password used to make this connection';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."DBURL" IS 'The database url used to make this connection';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."NAME" IS '//OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."NATIVE_SQL" IS 'The native sql used to create this connection';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONNECTIONS"."STATUS" IS 'Status of Migration, = captured,converted,generated,datamoved';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_CONNECTIONS"  IS 'This table is used to store connection information.  For example, in migrations, we could be carrying out a consolidation which occurs across many connections.';
--------------------------------------------------------
--  DDL for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" 
   (	"ID" NUMBER, 
	"REF_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"CONSTRAINT_ID_FK" NUMBER, 
	"COLUMN_ID_FK" NUMBER, 
	"COLUMN_PORTION" NUMBER, 
	"CONSTRAINT_TEXT" CLOB, 
	"DETAIL_ORDER" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("CONSTRAINT_TEXT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS"."REF_FLAG" IS '"N" or Null signify that this column is the colum that is used in the constraint.  A flag of Y signifies that the colum is a referenced column (i.e. part of a foreign key constraint)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS"."CONSTRAINT_ID_FK" IS 'Constraint that this detail belongs to //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS"."COLUMN_PORTION" IS 'The portion of a column this detail belongs (e.g. for constrints on substrings)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS"  IS 'Constraint details show what columns are "involved" in a constraint.';
--------------------------------------------------------
--  DDL for Table MD_CONSTRAINTS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" 
   (	"ID" NUMBER, 
	"DELETE_CLAUSE" VARCHAR2(4000 BYTE), 
	"NAME" VARCHAR2(4000 BYTE), 
	"CONSTRAINT_TYPE" VARCHAR2(4000 BYTE), 
	"TABLE_ID_FK" NUMBER, 
	"REFTABLE_ID_FK" NUMBER, 
	"CONSTRAINT_TEXT" CLOB, 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("CONSTRAINT_TEXT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."DELETE_CLAUSE" IS 'delete option , can be either CASCADE, RESTRICT or NULL';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."NAME" IS 'Name of the constraint //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."CONSTRAINT_TYPE" IS 'Type of the constraint (e.g. CHECK)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."TABLE_ID_FK" IS 'Table on which this constraint exists //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."REFTABLE_ID_FK" IS 'Used in foreign keys - this gives the table that we refer to.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_CONSTRAINTS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_CONSTRAINTS"  IS 'Table for storing information about a constraint';
--------------------------------------------------------
--  DDL for Table MD_DERIVATIVES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_DERIVATIVES" 
   (	"ID" NUMBER, 
	"SRC_ID" NUMBER, 
	"SRC_TYPE" VARCHAR2(4000 BYTE), 
	"DERIVED_ID" NUMBER, 
	"DERIVED_TYPE" VARCHAR2(4000 BYTE), 
	"DERIVED_CONNECTION_ID_FK" NUMBER, 
	"TRANSFORMED" CHAR(1 BYTE), 
	"ORIGINAL_IDENTIFIER" VARCHAR2(4000 BYTE), 
	"NEW_IDENTIFIER" VARCHAR2(4000 BYTE), 
	"DERIVED_OBJECT_NAMESPACE" VARCHAR2(40 BYTE), 
	"DERIVATIVE_REASON" VARCHAR2(10 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE), 
	"ENABLED" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_DERIVATIVES"."TRANSFORMED" IS 'Set this field to ''Y'' if we carry out any sort of transformation on teh derived object.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_DERIVATIVES"  IS 'This table is used to store objects that are derived from each other.  For example in a migration an auto-increment column in a source model could be mapped to a primary key, and a sequence, and a trigger.  The MD_DERIVATIVES table would store the fact that these 3 objects are derived from the auto-increment column.';
--------------------------------------------------------
--  DDL for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" 
   (	"ID" NUMBER, 
	"APPLICATIONFILES_ID" NUMBER, 
	"PATTERN" VARCHAR2(4000 BYTE), 
	"STRING_FOUND" VARCHAR2(4000 BYTE), 
	"STRING_REPLACED" VARCHAR2(4000 BYTE), 
	"TYPE" VARCHAR2(200 BYTE), 
	"STATUS" VARCHAR2(4000 BYTE), 
	"LINE" NUMBER, 
	"PATTERN_START" NUMBER, 
	"PATTERN_END" NUMBER, 
	"DUE_DATE" DATE, 
	"DB_TYPE" VARCHAR2(100 BYTE), 
	"CODE_TYPE" VARCHAR2(1000 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"PRIORITY" NUMBER(*,0), 
	"SECURITY_GROUP_ID" VARCHAR2(20 BYTE) DEFAULT '0', 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(4000 BYTE), 
	"LAST_UPDATED" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."PATTERN" IS 'Pattern used to search source file for interesting artifiacts';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."STRING_FOUND" IS 'String found in source from the pattern supplied';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."STRING_REPLACED" IS 'This is the string which replace the string found if it was replaced.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."TYPE" IS 'This is the type of the replacement.  It could be a straight replace from a replacement pattern, or we could have passed the string to a translator which would change the string depending on the database.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."STATUS" IS 'Pattern used to search source file for interesting artifiacts';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."DUE_DATE" IS 'Due date is used by the TODO mechanism to manage the validation and work to complete this change';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."DB_TYPE" IS 'Source database calls type';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."CODE_TYPE" IS 'Source code db api, like dblib, jdbc';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."DESCRIPTION" IS 'This is a description of the artifact which will have a default generated by the scanner and then can be modified by the user to be more appropriate for their use';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_FILE_ARTIFACTS"."PRIORITY" IS 'The priority is set for the TODOs so they can be managed by the user';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS"  IS 'Holds a tuple for each interesting thing the scanner finds in a file';
--------------------------------------------------------
--  DDL for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" 
   (	"ID" NUMBER, 
	"GROUP_ID_FK" NUMBER, 
	"USER_ID_FK" NUMBER, 
	"GROUP_MEMBER_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUP_MEMBERS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUP_MEMBERS"."USER_ID_FK" IS 'Id of member';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUP_MEMBERS"."GROUP_MEMBER_ID_FK" IS 'groups can be members of groups';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS"  IS 'This table is used to store the members of a group.';
--------------------------------------------------------
--  DDL for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" 
   (	"ID" NUMBER, 
	"GROUP_ID_FK" NUMBER, 
	"PRIVILEGE_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES"  IS 'This table stores the privileges granted to a group (or role)';
--------------------------------------------------------
--  DDL for Table MD_GROUPS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_GROUPS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"GROUP_NAME" VARCHAR2(4000 BYTE), 
	"GROUP_FLAG" CHAR(1 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUPS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUPS"."SCHEMA_ID_FK" IS 'Schema in which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUPS"."GROUP_NAME" IS 'Name of the group //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUPS"."GROUP_FLAG" IS 'This is a flag to signify a group or a role.  If this is ''R'' it means the group is known as a Role.  Any other value means it is known as a group.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUPS"."NATIVE_SQL" IS 'SQL Used to generate this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_GROUPS"."NATIVE_KEY" IS 'Unique id for this object at source';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_GROUPS"  IS 'Groups of users in a schema';
--------------------------------------------------------
--  DDL for Table MD_INDEX_DETAILS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" 
   (	"ID" NUMBER, 
	"INDEX_ID_FK" NUMBER, 
	"COLUMN_ID_FK" NUMBER, 
	"INDEX_PORTION" NUMBER, 
	"DETAIL_ORDER" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEX_DETAILS"."INDEX_ID_FK" IS 'The index to which this detail belongs. //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEX_DETAILS"."INDEX_PORTION" IS 'To support indexing on part of a field';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS"  IS 'This table stores the details of an index.  It shows what columns are "part" of the index.';
--------------------------------------------------------
--  DDL for Table MD_INDEXES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_INDEXES" 
   (	"ID" NUMBER, 
	"INDEX_TYPE" VARCHAR2(4000 BYTE), 
	"TABLE_ID_FK" NUMBER, 
	"INDEX_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEXES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEXES"."INDEX_TYPE" IS 'Type of the index e.g. PRIMARY';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEXES"."TABLE_ID_FK" IS 'Table that this index is on //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEXES"."INDEX_NAME" IS 'Name of the index //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEXES"."NATIVE_SQL" IS 'SQL used to create the index at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_INDEXES"."NATIVE_KEY" IS 'A unique identifier for this object at the source';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_INDEXES"  IS 'This table is used to store information about the indexes in a schema';
--------------------------------------------------------
--  DDL for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"PARENT_ID" NUMBER, 
	"CHILD_ID" NUMBER, 
	"PARENT_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"CHILD_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_DEPENDENCY"."CONNECTION_ID_FK" IS 'The connection that this exists in //PARENTFIELD';
--------------------------------------------------------
--  DDL for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"OBJECT_ID" NUMBER, 
	"OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"PARAM_EXISTING" NUMBER, 
	"PARAM_ORDER" NUMBER, 
	"PARAM_NAME" VARCHAR2(4000 BYTE), 
	"PARAM_TYPE" VARCHAR2(4000 BYTE), 
	"PARAM_DATA_TYPE" VARCHAR2(4000 BYTE), 
	"PERCISION" NUMBER, 
	"SCALE" NUMBER, 
	"NULLABLE" CHAR(1 BYTE), 
	"DEFAULT_VALUE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_PARAMETER"."CONNECTION_ID_FK" IS 'the connection in which this belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_PARAMETER"."PARAM_EXISTING" IS '1 represents a new parameter for PL/SQL that was not present in the origional. 0 represents a n existing parameter that was present in the origional';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_PARAMETER"."PARAM_ORDER" IS 'IF -1 THEN THIS PARAM IS A RETURN PARAMETER. 1 WILL BE THE FIRST PARAMETER IN THE PARAMETER LIST';
--------------------------------------------------------
--  DDL for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"PARENT_ID" NUMBER, 
	"CHILD_NAME" VARCHAR2(4000 BYTE), 
	"PARENT_TYPE" VARCHAR2(4000 BYTE), 
	"CHILD_TYPE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_WEAKDEP"."CHILD_NAME" IS 'name of the child,  as weak dependencies dont have reference to child id';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_WEAKDEP"."PARENT_TYPE" IS 'MD_<tablename>';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_MIGR_WEAKDEP"."CHILD_TYPE" IS 'Generic Type (not MD_<tablename>)';
--------------------------------------------------------
--  DDL for Table MD_NUMROW$SOURCE
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_NUMROW$SOURCE" 
   (	"NUMROWS" NUMBER(10,0), 
	"NAME" VARCHAR2(4000 BYTE), 
	"OBJID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MD_NUMROW$TARGET
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_NUMROW$TARGET" 
   (	"NUMROWS" NUMBER(10,0), 
	"NAME" VARCHAR2(4000 BYTE), 
	"OBJID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_OTHER_OBJECTS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_OTHER_OBJECTS"."SCHEMA_ID_FK" IS 'Schema to which this object blongs. //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_OTHER_OBJECTS"."NAME" IS 'Name of this object //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_OTHER_OBJECTS"."NATIVE_SQL" IS 'The native SQL used to create this object';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_OTHER_OBJECTS"."NATIVE_KEY" IS 'A key that identifies this object at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS"  IS 'For storing objects that don''''t belong anywhere else';
--------------------------------------------------------
--  DDL for Table MD_PACKAGES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_PACKAGES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"PACKAGE_HEADER" CLOB, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("PACKAGE_HEADER") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PACKAGES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PACKAGES"."SCHEMA_ID_FK" IS 'the schema in which this package resides //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PACKAGES"."NAME" IS 'Name of this package //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PACKAGES"."NATIVE_SQL" IS 'The SQL used to create this package at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PACKAGES"."NATIVE_KEY" IS 'A unique identifer for this object at source.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PACKAGES"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_PACKAGES"  IS 'For storing packages';
--------------------------------------------------------
--  DDL for Table MD_PARTITIONS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_PARTITIONS" 
   (	"ID" NUMBER, 
	"TABLE_ID_FK" NUMBER, 
	"NATIVE_SQL" CLOB, 
	"PARTITION_EXPRESSION" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PARTITIONS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PARTITIONS"."TABLE_ID_FK" IS 'The table that this partition refers to //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PARTITIONS"."NATIVE_SQL" IS 'The SQL used to create this partition at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PARTITIONS"."PARTITION_EXPRESSION" IS 'The partition expression';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_PARTITIONS"  IS 'Partition information is stored in this table.';
--------------------------------------------------------
--  DDL for Table MD_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_PRIVILEGES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"PRIVILEGE_NAME" VARCHAR2(4000 BYTE), 
	"PRIVELEGE_OBJECT_ID" NUMBER, 
	"PRIVELEGEOBJECTTYPE" VARCHAR2(4000 BYTE), 
	"PRIVELEGE_TYPE" VARCHAR2(4000 BYTE), 
	"ADMIN_OPTION" CHAR(1 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."SCHEMA_ID_FK" IS 'The schema to which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."PRIVILEGE_NAME" IS 'The name of the privilege //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."PRIVELEGE_OBJECT_ID" IS 'This references the table, view, etc on which the privelege exists.  This can be NULL for things like system wide privileges';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."PRIVELEGEOBJECTTYPE" IS 'The type the privelege is on (e.g. INDEX)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."PRIVELEGE_TYPE" IS 'e.g.select';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."ADMIN_OPTION" IS 'Flag to show if this was granted with admin option.  ''Y'' means it was granted with admin option ''N'' means it was NOT granted with admin option.  NULL means not applicable (e.g. not known, not supported by source platform, etc.)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."NATIVE_SQL" IS 'The SQL used to create this privilege at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PRIVILEGES"."NATIVE_KEY" IS 'An identifier for this object at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_PRIVILEGES"  IS 'This table stores privilege information';
--------------------------------------------------------
--  DDL for Table MD_PROJECTS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_PROJECTS" 
   (	"ID" NUMBER, 
	"PROJECT_NAME" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PROJECTS"."ID" IS 'Primary key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_PROJECTS"."PROJECT_NAME" IS 'Name of the project //OBJECTNAME';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_PROJECTS"  IS 'This is a top level container for a set of connections.';
--------------------------------------------------------
--  DDL for Table MD_REGISTRY
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_REGISTRY" 
   (	"OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"OBJECT_NAME" VARCHAR2(30 BYTE), 
	"DESC_OBJECT_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "CRISTIAN_DB"."MD_REGISTRY"  IS 'Table to store information on the MD_ repository.  This lists the objects to be dropped if you wish to remove the repository';
--------------------------------------------------------
--  DDL for Table MD_REPOVERSIONS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_REPOVERSIONS" 
   (	"REVISION" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "CRISTIAN_DB"."MD_REPOVERSIONS"  IS 'This table is used to version this schema for future requirements.';
--------------------------------------------------------
--  DDL for Table MD_SCHEMAS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_SCHEMAS" 
   (	"ID" NUMBER, 
	"CATALOG_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"TYPE" CHAR(1 BYTE), 
	"CHARACTER_SET" VARCHAR2(4000 BYTE), 
	"VERSION_TAG" VARCHAR2(40 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."CATALOG_ID_FK" IS 'Catalog to which this schema blongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."NAME" IS 'Name of the schema //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."TYPE" IS 'Type of this schema.  Eaxamples are ''CAPTURED'' OR ''CONVERTED''';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."CHARACTER_SET" IS 'The characterset of this schema';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."VERSION_TAG" IS 'A version string that can be used for tagging/baseling a schema';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."NATIVE_SQL" IS 'The native SQL used to create this schema';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SCHEMAS"."NATIVE_KEY" IS 'A unique identifier that this schema is known as in its source state.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_SCHEMAS"  IS 'This is the holder for schemas';
--------------------------------------------------------
--  DDL for Table MD_SEQUENCES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_SEQUENCES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"SEQ_START" NUMBER, 
	"INCR" NUMBER DEFAULT 1, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE) DEFAULT '0', 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."SCHEMA_ID_FK" IS 'The schema to which this object belongs. //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."NAME" IS 'Name of this sequence //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."SEQ_START" IS 'Starting point of the sequence';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."INCR" IS 'Increment value of the sequence';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."NATIVE_SQL" IS 'SQL used to create this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SEQUENCES"."NATIVE_KEY" IS 'Identifier for this object at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_SEQUENCES"  IS 'For storing information on sequences.';
--------------------------------------------------------
--  DDL for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"PROGRAMTYPE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(4000 BYTE), 
	"PACKAGE_ID_FK" NUMBER, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"LINECOUNT" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."SCHEMA_ID_FK" IS 'Schema to which this object belongs.  Note that the PACKAGE_ID_FK (if present also leads us to the relevant schema), however a stored program may or may not belong in a package.  If it is in a package, then the SCHEMA_ID_FK and the SCHEME_ID_FK in the parent package should match //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."PROGRAMTYPE" IS 'Java/TSQL/PLSQL, etc.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."NAME" IS 'Name of the stored program //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."PACKAGE_ID_FK" IS 'The package to which this object belongs';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."NATIVE_KEY" IS 'A unique indetifier for this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_STORED_PROGRAMS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS"  IS 'Container for stored programs.';
--------------------------------------------------------
--  DDL for Table MD_SYNONYMS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_SYNONYMS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"SYNONYM_FOR_ID" NUMBER, 
	"FOR_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"PRIVATE_VISIBILITY" CHAR(1 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."SCHEMA_ID_FK" IS 'The schema to which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."NAME" IS 'Synonym name //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."SYNONYM_FOR_ID" IS 'What object this is a synonym for';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."FOR_OBJECT_TYPE" IS 'The type this is a synonym for (e.g. INDEX)';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."PRIVATE_VISIBILITY" IS 'Visibility - Private or Public.  If Private_visibility = ''Y'' means this is a private synonym.  Anything else means it is a public synonym';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_SYNONYMS"."NATIVE_KEY" IS 'An identifier for this object at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_SYNONYMS"  IS 'For storing synonym information.';
--------------------------------------------------------
--  DDL for Table MD_TABLES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_TABLES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"TABLE_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"QUALIFIED_NATIVE_NAME" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLES"."SCHEMA_ID_FK" IS 'Schema in which this table resides //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLES"."TABLE_NAME" IS 'Name of the table //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLES"."NATIVE_SQL" IS 'SQL Used to create this table at soruce';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLES"."NATIVE_KEY" IS 'Unique identifier for this table at source';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_TABLES"  IS 'Table used to store information about tables.';
--------------------------------------------------------
--  DDL for Table MD_TABLESPACES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_TABLESPACES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"TABLESPACE_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLESPACES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLESPACES"."SCHEMA_ID_FK" IS 'Schema to which this tablespace belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLESPACES"."TABLESPACE_NAME" IS 'Name of the table space //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLESPACES"."NATIVE_SQL" IS 'The SQL used to create this tablespace';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TABLESPACES"."NATIVE_KEY" IS 'A unique identifier for this object at source';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_TABLESPACES"  IS 'For storing information about tablespaces.';
--------------------------------------------------------
--  DDL for Table MD_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_TRIGGERS" 
   (	"ID" NUMBER, 
	"TABLE_OR_VIEW_ID_FK" NUMBER, 
	"TRIGGER_ON_FLAG" CHAR(1 BYTE), 
	"TRIGGER_NAME" VARCHAR2(4000 BYTE), 
	"TRIGGER_TIMING" VARCHAR2(4000 BYTE), 
	"TRIGGER_OPERATION" VARCHAR2(4000 BYTE), 
	"TRIGGER_EVENT" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"LINECOUNT" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."TABLE_OR_VIEW_ID_FK" IS 'Table on which this trigger fires';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."TRIGGER_ON_FLAG" IS 'Flag to show iif the trigger is on a table or a view.  If it is a table this should be ''T''. If it is on a view this should be ''V''';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."TRIGGER_NAME" IS 'Name of the trigger //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."TRIGGER_TIMING" IS 'before, after ,etc.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."TRIGGER_OPERATION" IS 'insert, delete, etc.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."TRIGGER_EVENT" IS 'The actual trigger that gets fired ';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."NATIVE_SQL" IS 'The full definition ';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."NATIVE_KEY" IS 'UInique identifer for this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_TRIGGERS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_TRIGGERS"  IS 'For storing information about triggers.';
--------------------------------------------------------
--  DDL for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"DATA_TYPE_NAME" VARCHAR2(4000 BYTE), 
	"DEFINITION" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"."SCHEMA_ID_FK" IS 'Schema to which this object blongs. //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"."DATA_TYPE_NAME" IS 'The name of the data type //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"."DEFINITION" IS 'The definition of the data type';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"."NATIVE_SQL" IS 'The native SQL used to create this object';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"."NATIVE_KEY" IS 'An unique identifier for this object at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES"  IS 'For storing information on user defined data types.';
--------------------------------------------------------
--  DDL for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" 
   (	"ID" NUMBER, 
	"USER_ID_FK" NUMBER, 
	"PRIVILEGE_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UDPATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_PRIVILEGES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_PRIVILEGES"."USER_ID_FK" IS 'User';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USER_PRIVILEGES"."PRIVILEGE_ID_FK" IS 'Privilege';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES"  IS 'This table stores privileges granted to individual users';
--------------------------------------------------------
--  DDL for Table MD_USERS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_USERS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"USERNAME" VARCHAR2(4000 BYTE), 
	"PASSWORD" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USERS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USERS"."SCHEMA_ID_FK" IS 'Shema in which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USERS"."USERNAME" IS 'Username for login //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USERS"."PASSWORD" IS 'Password for login';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USERS"."NATIVE_SQL" IS 'SQL Used to create this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_USERS"."NATIVE_KEY" IS 'Unique identifier for this object at source.';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_USERS"  IS 'User information.';
--------------------------------------------------------
--  DDL for Table MD_VIEWS
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MD_VIEWS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"VIEW_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"LINECOUNT" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MD_VIEWS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_VIEWS"."SCHEMA_ID_FK" IS 'The schema to which this obect blongs. //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_VIEWS"."VIEW_NAME" IS 'The name of the view //OBJECTNAME';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_VIEWS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_VIEWS"."NATIVE_KEY" IS 'An identifier for this object at source.';
   COMMENT ON COLUMN "CRISTIAN_DB"."MD_VIEWS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "CRISTIAN_DB"."MD_VIEWS"  IS 'For storing information on views.';
--------------------------------------------------------
--  DDL for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" 
   (	"ID" NUMBER, 
	"PROJECT_ID_FK" NUMBER, 
	"MAP_NAME" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP"."PROJECT_ID_FK" IS '//PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP"."MAP_NAME" IS 'A name for the map';
   COMMENT ON TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP"  IS 'Table for storing data type maps.  A map is simply a collection of rules';
--------------------------------------------------------
--  DDL for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" 
   (	"ID" NUMBER, 
	"MAP_ID_FK" NUMBER, 
	"SOURCE_DATA_TYPE_NAME" VARCHAR2(4000 BYTE), 
	"SOURCE_PRECISION" NUMBER, 
	"SOURCE_SCALE" NUMBER, 
	"TARGET_DATA_TYPE_NAME" VARCHAR2(4000 BYTE), 
	"TARGET_PRECISION" NUMBER, 
	"TARGET_SCALE" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."MAP_ID_FK" IS 'The map to which this rule belongs //PARENTFIELD';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_DATA_TYPE_NAME" IS 'Source data type';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_PRECISION" IS 'Precison to match';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_SCALE" IS 'scale to match';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_DATA_TYPE_NAME" IS 'data type name to transform to';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_PRECISION" IS 'precision to map to ';
   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_SCALE" IS 'scale to map to';
--------------------------------------------------------
--  DDL for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"OBJECT_ID" NUMBER, 
	"OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"GENERATION_ORDER" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CRISTIAN_DB"."MIGR_GENERATION_ORDER"."CONNECTION_ID_FK" IS '//PARENTFIELD';
--------------------------------------------------------
--  DDL for Table MIGRLOG
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."MIGRLOG" 
   (	"ID" NUMBER, 
	"PARENT_LOG_ID" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"SEVERITY" NUMBER(4,0), 
	"LOGTEXT" VARCHAR2(4000 BYTE), 
	"PHASE" VARCHAR2(100 BYTE), 
	"REF_OBJECT_ID" NUMBER, 
	"REF_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"CONNECTION_ID_FK" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PROFESIONAL
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."PROFESIONAL" 
   (	"ID_PROFESIONAL" NUMBER(*,0), 
	"RUT_PROFESIONAL" VARCHAR2(8 BYTE), 
	"DV_RUT_PROFESIONAL" VARCHAR2(1 BYTE), 
	"NOMBRES_PROFESIONAL" VARCHAR2(255 BYTE), 
	"AP_PATERNO_PROF" VARCHAR2(255 BYTE), 
	"AP_MATERNO_PROF" VARCHAR2(255 BYTE), 
	"FEC_INGRESO_PROF" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STAGE_MIGRLOG
--------------------------------------------------------

  CREATE TABLE "CRISTIAN_DB"."STAGE_MIGRLOG" 
   (	"SVRID_FK" NUMBER, 
	"DBID_GEN_FK" NUMBER, 
	"ID" NUMBER, 
	"REF_OBJECT_ID" NUMBER, 
	"REF_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"LOG_DATE" TIMESTAMP (6), 
	"SEVERITY" NUMBER(4,0), 
	"LOGTEXT" VARCHAR2(4000 BYTE), 
	"PHASE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence CLIENTES
--------------------------------------------------------

   CREATE SEQUENCE  "CRISTIAN_DB"."CLIENTES"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CRISTIAN_DB"."CLIENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "CRISTIAN_DB"."CLIENTE_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DBOBJECTID_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "CRISTIAN_DB"."DBOBJECTID_SEQUENCE"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 50 START WITH 1 CACHE 50 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PROFESIONAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CRISTIAN_DB"."PROFESIONAL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
REM INSERTING into CRISTIAN_DB.CLIENTE
SET DEFINE OFF;
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('11','13525698','4','ANTONIO','1','1');
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('12','11254652','4','CRISTIAN','1','1');
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('13','22523251','4','JORGE','1','1');
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('14','85858545','4','LUIS','1','1');
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('15','25555545','4','RUBEN','1','1');
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('4','15821324','5','LUIS MENDEZ ALBORNOZ','1','1');
Insert into CRISTIAN_DB.CLIENTE (ID_CLIENTE,RUT_CLIENTE,DV_CLIENTE,RAZON_SOCIAL,TIPO_CONTRATO,STATUS_CLIENTE) values ('9','15821329','4','LUIS QUEZADA','1','1');
REM INSERTING into CRISTIAN_DB.MD_ADDITIONAL_PROPERTIES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_APPLICATIONFILES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_APPLICATIONS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_CATALOGS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_CODE_REGEX
SET DEFINE OFF;
Insert into CRISTIAN_DB.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values ('1','\#[A-Z1-9\@\#\_]','Temporary tables');
Insert into CRISTIAN_DB.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values ('2','INSERT','Insert statements');
Insert into CRISTIAN_DB.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values ('3','SELECT','Select statements');
Insert into CRISTIAN_DB.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values ('4','UPDATE','Update Statements');
Insert into CRISTIAN_DB.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values ('5','DELETE','Delete Statements');
REM INSERTING into CRISTIAN_DB.MD_COLUMNS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_CONNECTIONS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_CONSTRAINT_DETAILS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_CONSTRAINTS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_DERIVATIVES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_FILE_ARTIFACTS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_GROUP_MEMBERS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_GROUP_PRIVILEGES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_GROUPS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_INDEX_DETAILS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_INDEXES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_MIGR_DEPENDENCY
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_MIGR_PARAMETER
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_MIGR_WEAKDEP
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_NUMROW$SOURCE
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_NUMROW$TARGET
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_OTHER_OBJECTS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_PACKAGES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_PARTITIONS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_PRIVILEGES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_PROJECTS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_REGISTRY
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_REPOVERSIONS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_SCHEMAS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_SEQUENCES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_STORED_PROGRAMS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_SYNONYMS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_TABLES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_TABLESPACES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_TRIGGERS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_USER_DEFINED_DATA_TYPES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_USER_PRIVILEGES
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_USERS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MD_VIEWS
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MIGR_DATATYPE_TRANSFORM_MAP
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MIGR_DATATYPE_TRANSFORM_RULE
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MIGR_GENERATION_ORDER
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.MIGRLOG
SET DEFINE OFF;
REM INSERTING into CRISTIAN_DB.PROFESIONAL
SET DEFINE OFF;
Insert into CRISTIAN_DB.PROFESIONAL (ID_PROFESIONAL,RUT_PROFESIONAL,DV_RUT_PROFESIONAL,NOMBRES_PROFESIONAL,AP_PATERNO_PROF,AP_MATERNO_PROF,FEC_INGRESO_PROF) values ('4','15478856','4','MARCO','BARAHONA','GATICA',to_date('06/11/20','DD/MM/RR'));
Insert into CRISTIAN_DB.PROFESIONAL (ID_PROFESIONAL,RUT_PROFESIONAL,DV_RUT_PROFESIONAL,NOMBRES_PROFESIONAL,AP_PATERNO_PROF,AP_MATERNO_PROF,FEC_INGRESO_PROF) values ('5','13526584','4','CRISTIAN','RODRIGUEZ','NIETODD',to_date('19/11/97','DD/MM/RR'));
Insert into CRISTIAN_DB.PROFESIONAL (ID_PROFESIONAL,RUT_PROFESIONAL,DV_RUT_PROFESIONAL,NOMBRES_PROFESIONAL,AP_PATERNO_PROF,AP_MATERNO_PROF,FEC_INGRESO_PROF) values ('6','15254896','4','BELEN','HORMAZABAL','GAETED',to_date('29/05/98','DD/MM/RR'));
Insert into CRISTIAN_DB.PROFESIONAL (ID_PROFESIONAL,RUT_PROFESIONAL,DV_RUT_PROFESIONAL,NOMBRES_PROFESIONAL,AP_PATERNO_PROF,AP_MATERNO_PROF,FEC_INGRESO_PROF) values ('7','66332514','4','SUSANA','GAETEf','HORMAZABAL',to_date('05/12/88','DD/MM/RR'));
REM INSERTING into CRISTIAN_DB.STAGE_MIGRLOG
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CLIENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."CLIENTE_PK" ON "CRISTIAN_DB"."CLIENTE" ("ID_CLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_ADDITIONAL_PROPERTIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES_PK" ON "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_APPLICATIONFILES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_APPLICATIONFILES_PK" ON "CRISTIAN_DB"."MD_APPLICATIONFILES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_APPLICATIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_APPLICATIONS_PK" ON "CRISTIAN_DB"."MD_APPLICATIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_CATALOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_CATALOGS_PK" ON "CRISTIAN_DB"."MD_CATALOGS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_COLUMNS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_COLUMNS_PK" ON "CRISTIAN_DB"."MD_COLUMNS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_CONNECTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_CONNECTIONS_PK" ON "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_CONSTRAINTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_CONSTRAINTS_PK" ON "CRISTIAN_DB"."MD_CONSTRAINTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_CONSTRAINT_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS_PK" ON "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_FILE_ARTIFACTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_FILE_ARTIFACTS_PK" ON "CRISTIAN_DB"."MD_FILE_ARTIFACTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_GROUPS_PK" ON "CRISTIAN_DB"."MD_GROUPS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_GROUP_MEMBERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_GROUP_MEMBERS_PK" ON "CRISTIAN_DB"."MD_GROUP_MEMBERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_GROUP_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_GROUP_PRIVILEGES_PK" ON "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_INDEXES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_INDEXES_PK" ON "CRISTIAN_DB"."MD_INDEXES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_INDEX_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_INDEX_DETAILS_PK" ON "CRISTIAN_DB"."MD_INDEX_DETAILS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_OTHER_OBJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_OTHER_OBJECTS_PK" ON "CRISTIAN_DB"."MD_OTHER_OBJECTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_PACKAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_PACKAGES_PK" ON "CRISTIAN_DB"."MD_PACKAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_PARTITIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_PARTITIONS_PK" ON "CRISTIAN_DB"."MD_PARTITIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_PRIVILEGES_PK" ON "CRISTIAN_DB"."MD_PRIVILEGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_PROJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_PROJECTS_PK" ON "CRISTIAN_DB"."MD_PROJECTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_REGISTRY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_REGISTRY_PK" ON "CRISTIAN_DB"."MD_REGISTRY" ("OBJECT_TYPE", "OBJECT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_SCHEMAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_SCHEMAS_PK" ON "CRISTIAN_DB"."MD_SCHEMAS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_SEQUENCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_SEQUENCES_PK" ON "CRISTIAN_DB"."MD_SEQUENCES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_STORED_PROGRAMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_STORED_PROGRAMS_PK" ON "CRISTIAN_DB"."MD_STORED_PROGRAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_SYNONYMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_SYNONYMS_PK" ON "CRISTIAN_DB"."MD_SYNONYMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_TABLESPACES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_TABLESPACES_PK" ON "CRISTIAN_DB"."MD_TABLESPACES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_TABLES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_TABLES_PK" ON "CRISTIAN_DB"."MD_TABLES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_TRIGGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_TRIGGERS_PK" ON "CRISTIAN_DB"."MD_TRIGGERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_USERS_PK" ON "CRISTIAN_DB"."MD_USERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_USER_DEFINED_DATA_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES_PK" ON "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_USER_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_USER_PRIVILEGES_PK" ON "CRISTIAN_DB"."MD_USER_PRIVILEGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_VIEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MD_VIEWS_PK" ON "CRISTIAN_DB"."MD_VIEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGRDREIVATIVES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGRDREIVATIVES_PK" ON "CRISTIAN_DB"."MD_DERIVATIVES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGRLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGRLOG_PK" ON "CRISTIAN_DB"."MIGRLOG" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_DATATYPE_TRANSFORM_M_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_M_PK" ON "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_DATATYPE_TRANSFORM_R_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_R_PK" ON "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_DEPENDENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_DEPENDENCY_PK" ON "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_GENERATION_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_GENERATION_ORDER_PK" ON "CRISTIAN_DB"."MIGR_GENERATION_ORDER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_GENERATION_ORDER_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_GENERATION_ORDER_UK" ON "CRISTIAN_DB"."MIGR_GENERATION_ORDER" ("OBJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_PARAMETER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_PARAMETER_PK" ON "CRISTIAN_DB"."MD_MIGR_PARAMETER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MIGR_WEAKDEP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."MIGR_WEAKDEP_PK" ON "CRISTIAN_DB"."MD_MIGR_WEAKDEP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PROFESIONAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."PROFESIONAL_PK" ON "CRISTIAN_DB"."PROFESIONAL" ("ID_PROFESIONAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index STAGE_MIGRLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRISTIAN_DB"."STAGE_MIGRLOG_PK" ON "CRISTIAN_DB"."STAGE_MIGRLOG" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_APP_FILE_TYPE_IDX
--------------------------------------------------------

  CREATE INDEX "CRISTIAN_DB"."MD_APP_FILE_TYPE_IDX" ON "CRISTIAN_DB"."MD_APPLICATIONFILES" ("TYPE", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MD_STATE_TYPE__ID
--------------------------------------------------------

  CREATE INDEX "CRISTIAN_DB"."MD_STATE_TYPE__ID" ON "CRISTIAN_DB"."MD_APPLICATIONFILES" ("STATE", "TYPE", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger CLIENTE_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "CRISTIAN_DB"."CLIENTE_TRG" 
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
ALTER TRIGGER "CRISTIAN_DB"."CLIENTE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROFESIONAL_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "CRISTIAN_DB"."PROFESIONAL_TRG" 
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
ALTER TRIGGER "CRISTIAN_DB"."PROFESIONAL_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("REF_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("REF_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("PROP_KEY" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" ADD CONSTRAINT "MD_ADDITIONAL_PROPERTIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("COLUMN_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("COLUMN_ORDER" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("NULLABLE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_NULLABLE_Y_N" CHECK ((UPPER(NULLABLE) IN ('Y','N'))) ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PARTITIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PARTITIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PARTITIONS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PARTITIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PARTITIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PARTITIONS" ADD CONSTRAINT "MD_PARTITIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_REGISTRY
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_REGISTRY" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_REGISTRY" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_REGISTRY" ADD CONSTRAINT "MD_REGISTRY_PK" PRIMARY KEY ("OBJECT_TYPE", "OBJECT_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_REPOVERSIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_REPOVERSIONS" MODIFY ("REVISION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_CODE_REGEX
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CODE_REGEX" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CODE_REGEX" MODIFY ("REGEX" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CODE_REGEX" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" ADD CONSTRAINT "MD_OTHER_OBJECTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("MAP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("SOURCE_DATA_TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("TARGET_DATA_TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_MIGRLOG
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."STAGE_MIGRLOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."STAGE_MIGRLOG" MODIFY ("LOG_DATE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."STAGE_MIGRLOG" MODIFY ("SEVERITY" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."STAGE_MIGRLOG" ADD CONSTRAINT "STAGE_MIGRLOG_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("PARENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("CHILD_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("PARENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("CHILD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" MODIFY ("CONSTRAINT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" MODIFY ("DETAIL_ORDER" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_USERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USERS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USERS" ADD CONSTRAINT "MD_USERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("DATA_TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("DEFINITION" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("NATIVE_SQL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" ADD CONSTRAINT "MD_USER_DEFINED_DATA_TYPES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_APPLICATIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONS" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONS" ADD CONSTRAINT "MD_APPLICATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("SYNONYM_FOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("FOR_OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" MODIFY ("USER_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CATALOGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CATALOGS" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CATALOGS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CATALOGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("PARENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("CHILD_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("PARENT_OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("CHILD_OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_APPLICATIONFILES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("APPLICATIONS_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("URI" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" ADD CONSTRAINT "MD_APPLICATIONFILES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TABLES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" MODIFY ("QUALIFIED_NATIVE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" ADD CONSTRAINT "MD_TABLES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_TABLESPACES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLESPACES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLESPACES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLESPACES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_INDEXES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEXES" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEXES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEXES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("SEQ_START" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("INCR" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROFESIONAL
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("ID_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("RUT_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("DV_RUT_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("NOMBRES_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("AP_PATERNO_PROF" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("AP_MATERNO_PROF" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" MODIFY ("FEC_INGRESO_PROF" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."PROFESIONAL" ADD CONSTRAINT "PROFESIONAL_PK" PRIMARY KEY ("ID_PROFESIONAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_INDEX_DETAILS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" MODIFY ("INDEX_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" MODIFY ("COLUMN_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" MODIFY ("DETAIL_ORDER" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PACKAGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" ADD CONSTRAINT "MD_PACKAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_GROUPS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUPS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUPS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUPS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PROJECTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PROJECTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PROJECTS" MODIFY ("PROJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PROJECTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PROJECTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PROJECTS" ADD CONSTRAINT "MD_PROJECTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" MODIFY ("GENERATION_ORDER" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_UK" UNIQUE ("OBJECT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."CLIENTE" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."CLIENTE" MODIFY ("RUT_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."CLIENTE" MODIFY ("DV_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."CLIENTE" MODIFY ("RAZON_SOCIAL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."CLIENTE" MODIFY ("TIPO_CONTRATO" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."CLIENTE" MODIFY ("STATUS_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."CLIENTE" ADD CONSTRAINT "CLIENTE_PK" PRIMARY KEY ("ID_CLIENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CONNECTIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONNECTIONS" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONNECTIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONNECTIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" MODIFY ("GROUP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUP_MEMBERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("PARAM_EXISTING" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("PARAM_ORDER" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("PARAM_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("PARAM_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("PARAM_DATA_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("NULLABLE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("PRIVILEGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("PRIVELEGEOBJECTTYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("PRIVELEGE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("NATIVE_SQL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" ADD CONSTRAINT "MD_PRIVILEGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" MODIFY ("TABLE_OR_VIEW_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" MODIFY ("TRIGGER_ON_FLAG" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_TRIGGERS" ADD CONSTRAINT "MD_TRIGGERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_SCHEMAS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SCHEMAS" MODIFY ("CATALOG_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SCHEMAS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SCHEMAS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_SCHEMAS" ADD CONSTRAINT "MD_SCHEMAS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_DERIVATIVES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" MODIFY ("SRC_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" MODIFY ("DERIVED_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" MODIFY ("DERIVED_CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" ADD CONSTRAINT "MIGRDER_CHK" CHECK (ENABLED = 'Y' OR ENABLED = 'y' OR ENABLED = 'N' OR  ENABLED = 'n') ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" ADD CONSTRAINT "MIGRDREIVATIVES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" MODIFY ("ID" CONSTRAINT "MD_APP_FILE_ART_NONULL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" MODIFY ("APPLICATIONFILES_ID" CONSTRAINT "MD_APPL_FILE_FK_NONULL" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" ADD CONSTRAINT "MD_FILE_ARTIFACTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" MODIFY ("GROUP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" MODIFY ("PRIVILEGE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGRLOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGRLOG" MODIFY ("LOG_DATE" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGRLOG" MODIFY ("SEVERITY" NOT NULL ENABLE);
  ALTER TABLE "CRISTIAN_DB"."MIGRLOG" ADD CONSTRAINT "MIGRLOG_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_ADDITIONAL_PROPERTIES" ADD CONSTRAINT "MD_ADDITIONAL_PROPERTIES__FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_APPLICATIONFILES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONFILES" ADD CONSTRAINT "MD_FILE_APP_FK" FOREIGN KEY ("APPLICATIONS_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_APPLICATIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_APPLICATIONS" ADD CONSTRAINT "MD_APP_PROJ_FK" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_MD_CONNECTION_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_MD_PROJECT_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_MD__FK2" FOREIGN KEY ("COLUMN_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_COLUMNS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_MD__FK1" FOREIGN KEY ("CONSTRAINT_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONSTRAINTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_DERIVATIVES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_DERIVATIVES" ADD CONSTRAINT "MD_DERIVATIVES_MD_CONNECT_FK1" FOREIGN KEY ("DERIVED_CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_FILE_ARTIFACTS" ADD CONSTRAINT "MD_ARTIFACT_FILE_FK" FOREIGN KEY ("APPLICATIONFILES_ID")
	  REFERENCES "CRISTIAN_DB"."MD_APPLICATIONFILES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_USERS_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_GROUPS_FK2" FOREIGN KEY ("GROUP_MEMBER_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_GROUPS_FK1" FOREIGN KEY ("GROUP_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_MD_GR_FK1" FOREIGN KEY ("GROUP_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_MD_PR_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_INDEX_DETAILS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_MD_COLUM_FK1" FOREIGN KEY ("COLUMN_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_COLUMNS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_MD_INDEX_FK1" FOREIGN KEY ("INDEX_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_INDEXES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_FK2" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_OTHER_OBJECTS" ADD CONSTRAINT "MD_OTHER_OBJECTS_MD_SCHEM_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PACKAGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PACKAGES" ADD CONSTRAINT "MD_PACKAGES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PARTITIONS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PARTITIONS" ADD CONSTRAINT "MD_PARTITIONS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_PRIVILEGES" ADD CONSTRAINT "MD_PRIVILEGES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_SCHEMAS" ADD CONSTRAINT "MD_SCHEMAS_MD_CATALOGS_FK1" FOREIGN KEY ("CATALOG_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CATALOGS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_MD_SCH_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_MD_PAC_FK1" FOREIGN KEY ("PACKAGE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_PACKAGES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_TABLES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_TABLES" ADD CONSTRAINT "MD_TABLES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_USER_DEFINED_DATA_TYPES" ADD CONSTRAINT "MD_USER_DEFINED_DATA_TYPE_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_PRI_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CRISTIAN_DB"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_USE_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_USERS" ADD CONSTRAINT "MD_USERS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_FK1" FOREIGN KEY ("MAP_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MIGR_DATATYPE_TRANSFORM_MAP" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_MD__FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "CRISTIAN_DB"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "CRISTIAN_DB"."MIGRLOG" ADD CONSTRAINT "MIGR_MIGRLOG_FK" FOREIGN KEY ("PARENT_LOG_ID")
	  REFERENCES "CRISTIAN_DB"."MIGRLOG" ("ID") ENABLE;
