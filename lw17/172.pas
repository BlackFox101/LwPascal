PROGRAM ProgramReadNumber(INPUT, OUTPUT);
VAR
  I: INTEGER;

PROCEDURE ReadDigit(VAR InF: TEXT; VAR Digit: INTEGER);
{Считывает текущий символ из файла, если он - цифра, возвращает его 
 преобразу¤ в значение типа INTEGER. ?сли считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  READ(InF, Ch);
  Digit := -1;
  IF (Ch = '0') THEN Digit := 0 ELSE
  IF (Ch = '1') THEN Digit := 1 ELSE
  IF (Ch = '2') THEN Digit := 2 ELSE
  IF (Ch = '3') THEN Digit := 3 ELSE
  IF (Ch = '4') THEN Digit := 4 ELSE
  IF (Ch = '5') THEN Digit := 5 ELSE
  IF (Ch = '6') THEN Digit := 6 ELSE
  IF (Ch = '7') THEN Digit := 7 ELSE
  IF (Ch = '8') THEN Digit := 8 ELSE
  IF (Ch = '9') THEN Digit := 9
END;{ReadDigit}

PROCEDURE ReadNumber(VAR InF: TEXT; VAR Number: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа, 
 в соответствующее целое число Number}
CONST
  MAXINT = 32767;
VAR
  Ch: CHAR;
  TempDigit: INTEGER; 
BEGIN{ReadNumber}
  Number := 0; // Обнуляем Number
  WHILE (NOT EOLN) AND (TempDigit <> -1) AND (Number <> -1)
  DO
    BEGIN
      ReadDigit(InF, TempDigit);
      // Если встретилось чисто то считаем
      IF TempDigit <> -1 
      THEN
        IF (Number < MAXINT DIV 10)
        THEN
          Number := (Number * 10) + TempDigit
        ELSE
          IF (TempDigit <= MAXINT MOD 10) AND (Number = MAXINT DIV 10)
          THEN
            Number := (Number * 10) + TempDigit
          ELSE
            Number := -1
    END; 
END;{ReadNumber}

BEGIN{ProgramReadNumber }
  I := 0;
  ReadNumber(INPUT, I);
  WRITELN(I)
END.{ProgramReadNumber}
