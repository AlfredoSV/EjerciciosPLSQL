SET SERVEROUTPUT ON

DECLARE
    nombre    VARCHAR(39) := 'Alfredo';
    apellidop VARCHAR(39) := 'Sánchez';
    apellidom VARCHAR(39) := 'Verduzco';
    x         INT := 10;
BEGIN
    FOR i IN 1..x LOOP
        IF i = 5 THEN
            dbms_output.put_line('Llegó al 5');
        END IF;
        dbms_output.put_line(nombre
                             || ' '
                             || apellidop
                             || ' '
                             || apellidom);

    END LOOP;
END;

DECLARE
    numero       INT := '&VAL';
    factorialres INT := 1;
    i            INT := 1;
BEGIN
    WHILE i <= numero LOOP
        factorialres := factorialres * i;
        i := i + 1;
    END LOOP;

    dbms_output.put_line(factorialres);
END;

DECLARE
    idobra  obra.id_obra%TYPE := 0;
    regobra obra%rowtype;
BEGIN
    SELECT
        id_obra
    INTO idobra
    FROM
        obra
    WHERE
        id_obra = 2;

    SELECT
        *
    INTO regobra
    FROM
        obra
    WHERE
        id_obra = 2;

    dbms_output.put_line(idobra);
    dbms_output.put_line('--------------------------');
    dbms_output.put_line(regobra.nombre);
END;

DECLARE
    i INT := 1;
BEGIN
    LOOP       
        dbms_output.put_line(i);
        i:= i+1;
        EXIT WHEN i=10;
    END LOOP;
END;