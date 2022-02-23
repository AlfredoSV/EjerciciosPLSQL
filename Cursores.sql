SET SERVEROUTPUT ON

DECLARE
    CURSOR cur_obra IS
    ( SELECT
        *
    FROM
        obra
    );

    reg_obra obra%rowtype;
BEGIN
    dbms_output.put_line('-----LOOP-----');
    OPEN cur_obra;
    LOOP
        FETCH cur_obra INTO reg_obra;
        EXIT WHEN cur_obra%notfound;
        dbms_output.put_line(reg_obra.nombre);
    END LOOP;

    CLOSE cur_obra;
    dbms_output.put_line('-----FOR-----');
    FOR reg_obra IN cur_obra LOOP
        dbms_output.put_line(reg_obra.nombre);
    END LOOP;
    dbms_output.put_line('-----WHILE-----');
    OPEN cur_obra;
    FETCH cur_obra INTO reg_obra;
    WHILE cur_obra%found LOOP
        dbms_output.put_line(reg_obra.nombre);
        FETCH cur_obra INTO reg_obra;
    END LOOP;

    CLOSE cur_obra;
END;