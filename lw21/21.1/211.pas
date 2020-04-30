PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper
  и печатает новые символы в OUTPUT}
CONST
  MaxLen = 20;
TYPE
  Str = ARRAY [1 .. MaxLen] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  LenStr: 1 .. MaxLen;

PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; LenStr: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. MaxLen;
BEGIN {Encode}
  FOR Index := 1 TO LenStr
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE('_')
      ELSE
        WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      LenStr := 1;
      WHILE NOT EOLN AND (LenStr < MaxLen + 1)
      DO
        BEGIN
          READ(Msg[LenStr]);
          WRITE(Msg[LenStr]);
          LenStr := LenStr + 1;
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg, LenStr)
    END
END.  {Encryption}
