PROGRAM XPrintProgram(INPUT, OUTPUT);
{ Программа для псевдо-графической печати введенного пользователем символа }
CONST
  Min = 1;
  Max = 25;
  Elements = 5; // Число строк и столбцов
TYPE
  Plenty = SET OF Min .. Max; // Множество
VAR
  I, J: INTEGER;
  Letter: CHAR; // Буква

PROCEDURE XPrint(VAR FOut: TEXT; LetterRepresentation: CHAR);
var
  Digit: INTEGER;
  Representation: Plenty;
BEGIN {XPrint}
  CASE LetterRepresentation OF
    'A' : Representation := [2, 3, 4, 6, 10, 11, 15, 16, 17, 18, 19, 20, 21, 25];
    'B' : Representation := [1, 2, 3, 4, 7, 10, 12, 13, 14, 15, 17, 20, 21, 22, 23, 24];
    'C' : Representation := [2, 3, 4, 6, 10, 11, 16, 20, 22, 23, 24];
    'D' : Representation := [1, 2, 3, 4, 7, 10, 12, 15, 17, 20, 21, 22, 23, 24];
    'H' : Representation := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'E' : Representation := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'L' : Representation := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'O' : Representation := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'M' : Representation := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25]
  END;
  Digit := 1;
  FOR I := 1 TO Elements
  DO
  BEGIN
    FOR J := 1 TO Elements
    DO
    BEGIN
      IF Digit IN Representation // Проверка на вхождение элемента буквы
      THEN
        WRITE(FOut, 'X')
      ELSE
        WRITE(FOut, ' ');
      Digit := Digit + 1
    END;
    WRITELN
  END
END; {XPrint}

BEGIN {XPrintProgram}
  READLN(Letter); //Буква которую надо нарисовать
  XPrint(OUTPUT, Letter)
END. {XPrintProgram}
