PROGRAM CountWords(INPUT, OUTPUT);
USES
  WordModule, SortModule;
VAR
  TextFile, FileStats: TEXT;

PROCEDURE GetStatistics(VAR FIn, FOut: TEXT);
VAR
  CurrentWord: WordType;
  RootTreeSort: TreeType;
BEGIN {GetStatistics}
  IF NOT EOF(FIn)
  THEN
    BEGIN
      RootTreeSort := NIL;
      WHILE NOT EOF(FIn)
      DO
        BEGIN
          WHILE NOT EOLN(FIn)
          DO
            BEGIN
              GetWord(FIn, CurrentWord); //Получить слово
              IF CurrentWord <> ''
              THEN
                AddWordInTree(RootTreeSort, CurrentWord)
            END;
          READLN(FIn)
        END;
      PrintTreeStats(FOut, RootTreeSort)
    END
  ELSE
    WRITELN(Fout)
END; {GetStatistics}

BEGIN {CountWords}
  ASSIGN(TextFile, 'TextFile.TXT');
  ASSIGN(FileStats, 'FileStats.TXT');
  RESET(TextFile);
  REWRITE(FileStats);
  GetStatistics(TextFile, FileStats)
END. {CountWords}
