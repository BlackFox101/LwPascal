PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore <= 4
      DO
        BEGIN
          READ(NextScore);
          WHILE (NextScore > 100) OR (NextScore < 0)
          DO
            BEGIN
              WRITELN('Не верный балл! Введите балл от 0 до 100');
              READ(NextScore)
            END;
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      // Если в остатке больше или равно 5 округляем в большую сторону
      IF Ave MOD 10 >= 5
      THEN
        WRITE(Ave DIV 10 + 1)
      ELSE
        WRITE(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
      WRITELN;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
