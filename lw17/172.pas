PROGRAM ProgramReadNumber(INPUT, OUTPUT);
VAR
  I: INTEGER;

PROCEDURE ReadDigit(VAR InF: TEXT; VAR D: INTEGER);
{Cчитывает текущий символ из файла, если он - цифра, возвращает его 
 преобразу¤ в значение типа INTEGER. ?сли считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  READ(InF, Ch);
  D := -1;
  IF (Ch = '0') THEN D := 0 ELSE
  IF (Ch = '1') THEN D := 1 ELSE
  IF (Ch = '2') THEN D := 2 ELSE
  IF (Ch = '3') THEN D := 3 ELSE
  IF (Ch = '4') THEN D := 4 ELSE
  IF (Ch = '5') THEN D := 5 ELSE
  IF (Ch = '6') THEN D := 6 ELSE
  IF (Ch = '7') THEN D := 7 ELSE
  IF (Ch = '8') THEN D := 8 ELSE
  IF (Ch = '9') THEN D := 9
END;{ReadDigit}

PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа, 
 в соответствующее целое число N}
CONST
  MAXINT = 32767;
VAR
  Ch: CHAR;
  EmptyDigit: INTEGER; 
BEGIN{ReadNumber}
  N := 0; // Обнуляем N
  WHILE (NOT EOLN) AND (EmptyDigit <> -1) AND (N <> -1)
  DO
    BEGIN
      ReadDigit(InF, EmptyDigit);
      // Если встретилось чисто то считаем
      IF EmptyDigit <> -1 
      THEN
        IF (N < MAXINT DIV 10)
        THEN
          N := (N * 10) + EmptyDigit
        ELSE
          IF (EmptyDigit <= MAXINT MOD 10) AND (N = MAXINT DIV 10)
          THEN
            N := (N * 10) + EmptyDigit
          ELSE
            N := -1
    END; 
END;{ReadNumber}

BEGIN{ProgramReadNumber }
  ReadNumber(INPUT, I);
  WRITELN(I)
END.{ProgramReadNumber}
