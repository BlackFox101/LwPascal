PROGRAM Count3Reverse(INPUT, OUTPUT);
USES Count3;
VAR
  W1, W2, W3: CHAR;
BEGIN
  Start;
  WRITE('Ввод:');
  IF NOT EOLN
  THEN
    READ(W1); 
  IF NOT EOLN
  THEN
    READ(W2);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(W3);
      IF ((W1 < W2) AND (W3 < W2)) OR ((W1 > W2) AND (W3 > W2))
      THEN
        Bump;
      W1 := W2;
      W2 := W3
    END;
  WRITE;
  Value(W1, W2, W3);
  WRITELN('Количество реверсов:', W1, W2, W3)
END.
