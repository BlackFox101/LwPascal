PROGRAM CountWords(INPUT, OUTPUT);
USES
  Word, Container;
VAR
  TextFile, FileStats: TEXT;

PROCEDURE GetStatistics(VAR FIn, Fout: TEXT);
TYPE
  Words = RECORD
            Word: WordType;
            Quantity: INTEGER
          END;
VAR
 Word: ;
BEGIN {GetStatistics}
  {IF NOT EOF(FIn)
  THEN
    BEGIN
      WHILE NOT EOF(FIn)
      DO
        BEGIN
          WHILE NOT EOLN(FIn)
          DO
            BEGIN
              GetWord(FIn, Words.Word);// Получить слово
              //Добавить слово в контейнер
            END;
          READLN(FIn);
        END;
    END
  ELSE
    WRITELN(Fout);}
  GetWord(FIn, Words.Word);// Получить слово
END; {GetStatistics}

BEGIN {CountWords}
  ASSIGN(TextFile, 'TextFile.TXT');
  ASSIGN(FileStats, 'FileStats.TXT');
  RESET(TextFile);
  REWRITE(FileStats);
  GetStatistics(TextFile, OUTPUT)
END. {CountWords}
