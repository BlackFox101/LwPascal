PROGRAM ProgramReadDigit(INPUT, OUTPUT);
VAR
  EmptyDigit, Sum: INTEGER;
  
PROCEDURE ReadDigit(VAR InF: TEXT; VAR Digit: INTEGER);
{Считывает текущий символ из файла, если он - цифра, возвращает его 
 преобразу¤ в значение типа INTEGER. ≈сли считанный символ не цифра
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

BEGIN{ProgramReadDigit}
  Sum := 0;
  EmptyDigit := 0;
  WHILE (NOT EOLN) AND (EmptyDigit <> -1)
  DO
    BEGIN
      ReadDigit(INPUT, EmptyDigit);
      IF EmptyDigit <> -1
      THEN
        Sum := Sum + EmptyDigit
    END;
  WRITELN('Сумма:', Sum)
END.{ProgramReadDigit}
