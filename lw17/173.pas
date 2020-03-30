PROGRAM Stat(INPUT, OUTPUT);
VAR
  Min, Max, Sum, Average, Empty, CountDigit: INTEGER;
  Overflow: BOOLEAN;

PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER);
PROGRAM Stat(INPUT, OUTPUT);

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
  
BEGIN{Stat}
  IF NOT EOLN
  THEN
    BEGIN
      ReadNumber(INPUT, Min);
      Max := Min;
      Sum := Min;
      Average := Min;
      CountDigit := 1
    END;
  WHILE NOT EOLN
  DO
    BEGIN
      ReadNumber(INPUT, Empty);
      CountDigit := CountDigit + 1;
      IF NOT Overflow // Находим сумму и кол-во чисел
      THEN
        IF (32767 - Empty) > Sum
        THEN
          Sum := Sum + Empty
        ELSE
          Overflow := TRUE;
          
      IF Empty < Min
      THEN
        Min := Empty;
      IF Empty > Max
      THEN
        Max := Empty   
    END;
  WRITELN('Min=', Min, '.00');
  WRITELN('Max=', Max, '.00');
  IF Overflow
  THEN
    WRITELN('Среднее арифметическое не вычеслено так как произошло переполнение!')
  ELSE
    BEGIN
      Average := Sum DIV CountDigit;  // Находим среднее арифметическое
      WRITE('Average=', Average);
      Average := Sum MOD CountDigit;
      IF Average > 9
      THEN
        WRITELN('.', Average)
      ELSE
        WRITELN('.', Average, '0')
    END
END.{Stat}









