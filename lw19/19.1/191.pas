PROGRAM Prime(INPUT, OUTPUT);
{Находит простые числа в  диапазоне, ограниченном от 2 до 100,
  методом «Решето Эратосфена» }
CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF 0..Max; // Исходно множество из которого будем выбирать простые числа 
  PrimeDigit, TempDigit: INTEGER;
BEGIN{Prime}
  Sieve := [Min .. Max];
  PrimeDigit := Min; // Первое простое число
  WHILE Sieve <> [] 
  DO
    BEGIN
      TempDigit := PrimeDigit;
      WHILE TempDigit  <= Max // Убираем составные числа
      DO
        BEGIN
          Sieve := Sieve - [TempDigit];
          TempDigit := TempDigit + PrimeDigit;
        END;       
      WRITE(PrimeDigit, ' '); // Выводим простое число
      WHILE NOT(PrimeDigit IN Sieve) AND (PrimeDigit < Max)
      DO
        PrimeDigit := PrimeDigit + 1;
    END;
  WRITELN;
END.{Prime}