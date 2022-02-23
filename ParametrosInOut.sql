

CREATE OR REPLACE PROCEDURE SALUDO(NOMBRE in out VARCHAR)
IS
    piv VARCHAR(20);
BEGIN
    piv:= nombre;
    NOMBRE := 'Hola, ' || piv;
       
END;

SET SERVEROUTPUT ON

DECLARE
    
    SAL VARCHAR(30):= 'Alfredo';
BEGIN
    SALUDO(SAL);
    
    dbms_output.put_line(sal);
    
END;

