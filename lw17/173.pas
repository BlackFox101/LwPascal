PROGRAM Stat(INPUT, OUTPUT);
CONST
  MAXINT := 32767;
VAR
  Min, Max, Sum, Average, Empty, CountDigit: INTEGER;
  Overflow: BOOLEAN;

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
  EmptyDigit: INTEGER; 
BEGIN{ReadNumber}
  N := 0; // Обнуляем N
  WHILE NOT EOLN(InF) AND (EmptyDigit <> -1) AND (N <> -1)
PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER);
VAR
  Ch: CHAR;
  EmptyDigit: INTEGER;
BEGIN{ReadNumber}
  N := 0; // Обнуляем N
  Ch := '0'; // Инициализация Ch для цикла
  WHILE NOT EOLN(InF) AND (N <> -1) AND (('0' <= Ch) AND (Ch <= '9'))
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
        IF (MAXINT - Empty) > Sum
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
