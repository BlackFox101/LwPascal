PROGRAM ProgramReadNumber(INPUT, OUTPUT);
VAR
  I: INTEGER;

PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа, 
 в соответствующее целое число N}
VAR
  Ch: CHAR;
  EmptyDigit: INTEGER;  
BEGIN{ReadNumber}
  N := 0; // Обнуляем N
  Ch := '0'; // Инициализация Ch для цикла
  WHILE NOT EOLN(InF) AND (N <> -1) AND (('0' <= Ch) AND (Ch <= '9'))
  DO
    BEGIN
      READ(InF, Ch);
      IF ('0' <= Ch) AND (Ch <= '9')
      THEN
        BEGIN
          IF (Ch = '0') THEN EmptyDigit := 0 ELSE
          IF (Ch = '1') THEN EmptyDigit := 1 ELSE
          IF (Ch = '2') THEN EmptyDigit := 2 ELSE
          IF (Ch = '3') THEN EmptyDigit := 3 ELSE
          IF (Ch = '4') THEN EmptyDigit := 4 ELSE
          IF (Ch = '5') THEN EmptyDigit := 5 ELSE
          IF (Ch = '6') THEN EmptyDigit := 6 ELSE
          IF (Ch = '7') THEN EmptyDigit := 7 ELSE
          IF (Ch = '8') THEN EmptyDigit := 8 ELSE
          IF (Ch = '9') THEN EmptyDigit := 9;
          IF (N < 3276)
          THEN
            N := (N * 10) + EmptyDigit
          ELSE
            IF (EmptyDigit <= 7) AND (N = 3276)
            THEN
              N := (N * 10) + EmptyDigit
            ELSE
              N := -1
        END
    END
END;{ReadNumber}

BEGIN{ProgramReadNumber }
  ReadNumber(INPUT, I);
  WRITELN(I)
END.{ProgramReadNumber}
