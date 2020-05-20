PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper
  и печатает новые символы в OUTPUT}
CONST
  MaxLen = 20;
TYPE
  Str = ARRAY [1 .. MaxLen] OF CHAR;
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  LenStr: 0 .. MaxLen;
  ChiperFile, EncryptedMsg: TEXT; // Формата "Буква-ШифрБуквы"

PROCEDURE Initialize(VAR FInChiper: TEXT);
{Присвоить Code шифр замены}
var
  Letter, ChiperLetter: CHAR;
  I: CHAR;
BEGIN {Initialize}
  FOR I := ' ' TO 'Z'
  DO
    Code[I] := I; // Сначал все буквы зашифруем как "сами себе"
  RESET(FInChiper);
  WHILE NOT EOF(FInChiper)
  DO
    BEGIN
      WHILE NOT EOLN(FInChiper)
      DO
        BEGIN
          READ(FInChiper, Letter); //Буква которую хотим зашифровать
          IF NOT EOLN(FInChiper)
          THEN
            READ(FInChiper, ChiperLetter); //Пропустим '-'
          IF NOT EOLN(FInChiper)
          THEN
            READ(FInChiper, ChiperLetter); //Прочитаем шифр буквы
          IF Letter IN [' ' .. 'Z']
          THEN
            Code[ChiperLetter] := Letter
        END;
      READLN(FInChiper)
    END
END;  {Initialize}

PROCEDURE Encode(VAR MsgStr: Str; LenStr: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. MaxLen;
BEGIN {Encode}
  FOR Index := 1 TO LenStr
  DO
    IF MsgStr[Index] IN [' ' .. 'Z']
    THEN
      WRITE(OUTPUT, Code[MsgStr[Index]])
    ELSE
      WRITE(OUTPUT, MsgStr[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  ASSIGN(ChiperFile, 'ChiperFile.TXT');
  ASSIGN(EncryptedMsg, 'EncryptedMsg.TXT');
  {Инициализировать Code}
  Initialize(ChiperFile);
  RESET(EncryptedMsg);
  WHILE NOT EOF(EncryptedMsg)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      LenStr := 0;
      WHILE NOT EOLN(EncryptedMsg) AND (LenStr < MaxLen)
      DO
        BEGIN
          LenStr := LenStr + 1;
          READ(EncryptedMsg, Msg[LenStr]);
          WRITE(OUTPUT, Msg[LenStr])
        END;
      READLN(EncryptedMsg);
      WRITELN;
      {распечатать раскодированное сообщение}
      Encode(Msg, LenStr)
    END
END.  {Encryption}
