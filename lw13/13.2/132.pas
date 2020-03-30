PROGRAM Lexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Ch, Result: CHAR;
  
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR 
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOF(F1) AND NOT EOF(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2) OR (EOF (F1))
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2) OR (EOF (F2))
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2';
      IF EOF(F1) AND EOF(F2)
      THEN
        Result := '0'
    END {WHILE}
END; {Lexico}

BEGIN
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  READLN;
  REWRITE(F2);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2);
  Lexico(F1, F2, Result);
  WRITELN(Result)
END.











