PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE Copy(VAR A1, A2: TEXT);
VAR
  Ch: CHAR;
BEGIN { �������� INPUT � F1 }
  WHILE NOT EOLN(A1)
  DO
    BEGIN
      READ(A1, Ch);
      WRITE(A2, Ch)
    END;
  WRITELN(A2)
END;
BEGIN { BubbleSort }
  { �������� INPUT � F1 }
  REWRITE(F1);
  Copy(INPUT, F1);
  Sorted := 'Y';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { �������� F1 � F2,�������� �����������������
       � ����������� ������ �������� ������� �� �������}
      { �������� F2 � F1 }
    END;
  { �������� F1 � OUTPUT }
  RESET(F1);
  Copy(F1, OUTPUT)
END.{ BubbleSort }
