CREATE OR REPLACE TRIGGER ejemplo1 BEFORE
    INSERT ON obra
    FOR EACH ROW
BEGIN
     
    RAISE_APPLICATION_ERROR(-20000, 'Error') ;
     
    dbms_output.put_line(:new.id_obra);
    
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Excepcion');
END;

SET SERVEROUTPUT ON;

INSERT INTO obra VALUES (
    40,
    'Alfredo',
    'estado'
);