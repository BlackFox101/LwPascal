PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
  Sorted, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE Copy(VAR A1, A2: TEXT);
VAR
  Ch: CHAR;
BEGIN { Копируем INPUT в F1 }
  WHILE NOT EOLN(A1)
  DO
    BEGIN
      READ(A1, Ch);
      WRITE(A2, Ch)
    END;
  WRITELN(A2)
END;
BEGIN { BubbleSort }
  { Копируем INPUT в F1 }
  REWRITE(F1);
  Copy(INPUT, F1);
  Sorted := 'Y';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { Копируем F1 в F2,проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      { Копируем F2 в F1 }
    END;
  { Копируем F1 в OUTPUT }
  RESET(F1);
  Copy(F1, OUTPUT)
END.{ BubbleSort }
