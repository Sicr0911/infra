-- Wrapper de compose, NO el DDL real (ese vive en el repo de catalog y se
-- monta aparte para no duplicarlo).
--
-- gvenzl/oracle-xe:21-slim ejecuta los scripts de
-- /container-entrypoint-initdb.d/startup conectado a la CDB root, como SYS
-- (CON_ID=1) -- no dentro del PDB del APP_USER como cabria esperar. Sin este
-- cambio explicito de contenedor y schema, el DDL de catalog terminaria
-- creado en SYS, en la raiz, en vez de en CAMPUSLAB dentro de XEPDB1.
ALTER SESSION SET CONTAINER = XEPDB1;
ALTER SESSION SET CURRENT_SCHEMA = CAMPUSLAB;
@/opt/oracle/catalog-schema-source.sql
