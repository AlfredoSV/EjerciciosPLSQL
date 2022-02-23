SET SERVEROUTPUT ON;

CREATE OR REPLACE type Persona as OBJECT(nombre varchar(40));
commit;

declare

    perso Persona:=Persona('Alfredo');

begin

    DBMS_OUTPUT.PUT_LINE(perso.nombre);
end;


commit;
