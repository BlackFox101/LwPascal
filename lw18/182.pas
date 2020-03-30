PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  Letter = ['a' .. 'z', 'A' .. 'Z'];
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Name: Text;
  
PROCEDURE CopyName(VAR FIn: TEXT; VAR FOut: TEXT);
VAR
  Ch: CHAR;
BEGIN{CopyName}
  Ch := 'A';
  WHILE (Ch IN Letter)
  DO
    BEGIN
      READ(FIn, Ch);
      IF (Ch IN Letter)
      THEN
        WRITE(FOut, Ch) 
    END;
  WRITELN(FOut)
END;{CopyName}
PROCEDURE WriteName(VAR FIn: TEXT; VAR FOut: TEXT);
VAR
  Ch: CHAR;
BEGIN{WriteName}
  WHILE NOT EOLN(FIn)
  DO
    BEGIN
      READ(FIn, Ch);
      WRITE(FOut, Ch)
    END;
  WRITE(FOut, ' ')
END;{WriteName}

BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(Name);
      CopyName(INPUT, Name);
      WHILE WhichScore <= 4
      DO
        BEGIN
          READ(NextScore);
          WHILE (NextScore > 100) OR (NextScore < 0)
          DO
            BEGIN
              WRITELN('�� ������ ����! ������� ���� �� 0 �� 100');
              READ(NextScore)
            END;
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(Name);
      WriteName(Name, OUTPUT);
      // ���� � ������� ������ ��� ����� 5 ��������� � ������� �������
      IF Ave MOD 10 >= 5
      THEN
        WRITE(Ave DIV 10 + 1)
      ELSE
        WRITE(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      WRITELN;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
