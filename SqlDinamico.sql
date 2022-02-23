SET SERVEROUTPUT ON;

DECLARE

    sqlDin varchar(1000);
    
BEGIN
    
    sqlDin:= 'INSERT INTO OBRA VALUES(19,''AL'','' '')';
    
    execute immediate sqlDin;
    
END;

SELECT * FROM OBRA;


-----------------------


CREATE OR REPLACE PROCEDURE INSERTAR_SQL_DIN(id obra.id_obra%type,nombre obra.nombre%type,estado obra.estado%type)

as
    SQLDIN VARCHAR(1000):='INSERT INTO OBRA VALUES(';
begin
    
    SQLDIN:= SQLDIN || id || ',' || '''' || nombre ||''''||',' || '''' || estado || '''' || ')'; 
    
    EXECUTE IMMEDIATE sqldin;
    DBMS_OUTPUT.PUT_LINE(SQLDIN);
    COMMIT;
end INSERTAR_SQL_DIN;

execute insertar_sql_din(102,'prueba','estadoPrueba');

SELECT * FROM OBRA



