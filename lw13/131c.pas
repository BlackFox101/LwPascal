PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
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
PROCEDURE Sort(VAR A1, A2: TEXT);
VAR
  Sorted, Ch1, Ch2: CHAR;
BEGIN { Копируем F1 в F2, проверяя отсортированность и переставляя первые соседнии символы по порядку}
  Sorted := 'N';
  WHILE Sorted ='N'
  DO
    BEGIN
      BEGIN { Копируем F1 в F2, проверяя отсортированность
        и переставляя первые соседнии символы по порядку}
        Sorted := 'Y';
        RESET(A1);
        REWRITE(A2);
        IF NOT EOLN(A1)
        THEN
          BEGIN
            READ(A1, Ch1);
            WHILE NOT EOLN(A1)
            DO { По крайней мере два символа остается для Ch1,Ch2 }
              BEGIN
                READ(A1, Ch2);
                { Выводим   min(Ch1,Ch2) в  F2, записывая отсортированные символы }
                IF Ch1 <= Ch2
                THEN
                  BEGIN
                    WRITE(A2, Ch1);
                    Ch1 := Ch2
                  END
                ELSE
                  BEGIN
                    WRITE(A2, Ch2);
                    Sorted := 'N'
                  END
              END;
            WRITELN(A2, Ch1) { Выводим последний символ в F2 }
          END;
        RESET(F2);
        REWRITE(F1);
        Copy(F2, F1) 
      END
    END
END;
BEGIN { BubbleSort }
  { Копируем INPUT в F1 }
  REWRITE(F1);
  Copy(INPUT, F1);
  Sort(F1, F2);
  { Копируем F1 в OUTPUT }
  RESET(F1);
  Copy(F1, OUTPUT)
END.{ BubbleSort }
