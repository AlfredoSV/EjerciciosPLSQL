SET SERVEROUTPUT ON;

/* Escribir un bloque PL/SQL que cuente el número de filas que hay en la tabla 
productos, deposita el resultado en la variable v_num, y visualiza su contenido.
*/


CREATE TABLE productos (
    id     INT,
    nombre VARCHAR(40),
    stock  INT
);

DECLARE
    v_num productos.id%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_num
    FROM
        productos;

    dbms_output.put_line(v_num);
END;



/* Codificar un procedimiento que reciba una cadena y la visualice al revés.*/


CREATE OR REPLACE PROCEDURE cad_reves (
    cad VARCHAR
) AS
    cad_rev VARCHAR(400) := '';
    i       INT := length(cad);
BEGIN
    WHILE i > 0 LOOP
        cad_rev := cad_rev
                   || substr(cad, i, 1);
        i := i - 1;
    END LOOP;

    dbms_output.put_line(cad_rev);
END;

EXECUTE cad_reves('ALFREDO');



/* Escribir una función que reciba una fecha y devuelva el año, en número, 
correspondiente a esa fecha.
*/

CREATE OR REPLACE FUNCTION fecha_formato (
    fecha DATE
) RETURN INT AS
    resultado INT := '';
BEGIN
    resultado := to_number(to_char(fecha, 'YY'));
    RETURN resultado;
END;

SELECT
    fecha_formato('30/08/2023') AS dia
FROM
    dual;

/*Escribir un bloque PL/SQL que haga uso de la función anterior.
*/

DECLARE
    v_anio INT := 0;
BEGIN
    v_anio := fecha_formato(sysdate);
    dbms_output.put_line(v_anio);
END;



/*Desarrollar una función que devuelva el número de años completos que hay entre 
dos fechas que se pasan como argumentos.*/


CREATE OR REPLACE FUNCTION fecha_diferencia (
    fecha1 DATE,
    fecha2 DATE
) RETURN INT AS
    v_dif INT := 0;
BEGIN
    v_dif := months_between(fecha1, fecha2)/12;
    RETURN v_dif;
END;


SELECT fecha_diferencia(SYSDATE,'01/10/19') FROM DUAL;


/* Desarrollar un procedimiento que visualice el apellido y la fecha de alta de todos los 
empleados ordenados por apellido.
*/



CREATE TABLE EMPLEADOS(id number,nombre varchar(40), apellido varchar(40), fechaAlta date);

alter table EMPLEADOS add constraint pkid primary key(id); 

INSERT INTO EMPLEADOS VALUES(1,'Alfredo','Sánchez',sysdate);
INSERT INTO EMPLEADOS VALUES(2,'Alondra','Verduzco',sysdate);
INSERT INTO EMPLEADOS VALUES(3,'Sofia','Ingrid',sysdate);


CREATE OR REPLACE PROCEDURE SP_LISTAR_EMPLEADOS
IS
    CURSOR C_EMPLEADOS IS SELECT * FROM EMPLEADOS ORDER BY APELLIDO DESC;
BEGIN

    FOR R_EMPLEADO IN C_EMPLEADOS LOOP
        DBMS_OUTPUT.PUT_LINE(R_EMPLEADO.APELLIDO);
    END LOOP;
END;


EXEC SP_LISTAR_EMPLEADOS

