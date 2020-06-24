PROGRAM CountWords(INPUT, OUTPUT);
USES
  WordModule;
VAR
  TextFile, FileStats: TEXT;

PROCEDURE GetStatistics(VAR FIn, Fout: TEXT);
VAR
  CurrentWord: WordType;
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
              GetWord(FIn, CurrentWord); //Получить слово
              WRITELN(Fout, CurrentWord);
              {Добавить слово в контейнер}
              IF (CurrentWord))
              THEN
                //IncrementWordQuantity
              ELSE
                //AddWordInTree
            END;
          READLN(FIn);
        END;
      {Вывести статистику}
    END
  ELSE
    WRITELN(Fout);
END; {GetStatistics}

BEGIN {CountWords}
  ASSIGN(TextFile, 'TextFile.TXT');
  ASSIGN(FileStats, 'FileStats.TXT');
  RESET(TextFile);
  REWRITE(FileStats);
  GetStatistics(TextFile, OUTPUT)
END. {CountWords}
