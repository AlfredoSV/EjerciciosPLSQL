SET SERVEROUTPUT ON;

DECLARE
    TYPE arr IS
        VARRAY(3) OF INTEGER;
    vararr arr := arr(3, 6, 7);
    i      INT := 1;
BEGIN
    WHILE i <= 3 LOOP
        dbms_output.put_line(vararr(i));
        i:= i+1;
    END LOOP;
END;