PROGRAM CountWords(INPUT, OUTPUT);

VAR
  TextFile, FileStats: TEXT;

PROCEDURE GetStatistics(VAR FIn, Fout: TEXT);
BEGIN {GetStatistics}
  IF NOT EOF(FIn)
  THEN
    BEGIN
      WHILE NOT EOF(FIn)
      DO
        BEGIN
          WHILE NOT EOLN(FIn)
          DO
            BEGIN
              GetWord(FIn);// Получить слово
              //Добавить слово в контейнер
            END;
          READLN()
        END;
    END
  ELSE
    WRITELN;
END; {GetStatistics}

BEGIN {CountWords}
  ASSIGN(TextFile, 'TextFile.TXT');
  RESET(TextFile);
  //GetStatistics(TextFile, FileStats)

END. {CountWords}
