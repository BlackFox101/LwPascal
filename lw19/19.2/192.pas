PROGRAM SortDate(INPUT, OUTPUT);
USES WorkDateUnit;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
 
BEGIN{SortDate}
  ASSIGN(DateFile, 'DateFile.DAT');
  ASSIGN(TFile, 'TempFile.DAT');
  ASSIGN(FInput, 'FileInput.TXT');
  
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    BEGIN {Поместить новую дату в DateFile в соответствующее место}
      RESET(DateFile);
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          BEGIN {копируем элементы меньшие,чем D из DateFile в TFile}
            REWRITE(TFile);
            Copying := TRUE;
            WHILE NOT EOF(DateFile) AND Copying
            DO
              BEGIN
                READ(DateFile, VarDate);
                IF Less(VarDate, D)
                THEN
                  WRITE(TFile, VarDate)
                ELSE
                  Copying := FALSE
              END
          END;
          {копируем D в TFile}
          WRITE(TFile, D);
          BEGIN {копируем остаток DateFile в TFile}
            IF NOT Copying
            THEN
              WRITE(TFile, VarDate);
            WHILE NOT EOF(DateFile)
            DO
              BEGIN
                READ(DateFile, VarDate);                
                WRITE(TFile, VarDate)
              END
          END;
          {копируем TFile в DateFile}
          BEGIN
            REWRITE(DateFile);
            RESET(TFile);
            WHILE NOT EOF(TFile)
            DO
              BEGIN
                READ(TFile, VarDate);
                WRITE(DateFile, VarDate)
              END
          END
        END
    END;
  {Копируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END.{SortDate}
