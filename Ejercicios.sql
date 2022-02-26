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