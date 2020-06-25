UNIT WordModule;
INTERFACE
CONST
  RusAlphabet = ['�' .. '�', '�', '�' .. '�', '�'];
  EngAlphabet = ['A' .. 'Z', 'a' .. 'z'];
  MaxLenghtWord = 50;
TYPE
  WordType = STRING[MaxLenghtWord];

  PROCEDURE GetWord(VAR FIn: TEXT; VAR Word: WordType); // ��������� ��������� �����
  FUNCTION GetLowerCase(Letter: CHAR): CHAR; // ������� ��� ��������� ����� � ������ ��������
IMPLEMENTATION
  PROCEDURE GetWord(VAR FIn: TEXT; VAR Word: WordType);
  { ��������� ��������� �� ������ ������� � ������� �����}
  VAR
    Letter: CHAR;
    Rus, Eng: BOOLEAN;
  BEGIN {GetWord}
    Word := '';
    {Rus := FALSE;
    Eng := FALSE;}
    WHILE NOT EOF(FIn) AND NOT((Letter IN RusAlphabet) OR (Letter IN EngAlphabet))
    DO
      BEGIN
        READ(FIn, Letter);
        IF (Letter IN RusAlphabet) OR (Letter IN EngAlphabet)
        THEN
          Word := Word + GetLowerCase(Letter)
      END;
    WHILE NOT EOF(FIn) AND ((Letter IN RusAlphabet) OR (Letter IN EngAlphabet))
    DO
      BEGIN
        READ(FIn, Letter);
        IF (Letter IN RusAlphabet) OR (Letter IN EngAlphabet)
        THEN
          Word := Word + GetLowerCase(Letter)
      END
  END; {GetWord}

  FUNCTION GetLowerCase(Letter: CHAR): CHAR;
  { ���� �������� ����� � ������� �������� ���������� �� � ������,
    ���� '�' � '�' => '�',
    ���� �������� �� ����� �� ������ ������ ��}
  CONST
    UpperCase = ['�' .. '�', '�', 'A' .. 'Z'];
  BEGIN {GetLowerCase}
    IF (Letter IN RusAlphabet) OR (Letter IN EngAlphabet)
    THEN
      IF (Letter = '�') OR (Letter ='�')
      THEN
        GetLowerCase := '�'
      ELSE
        IF Letter IN UpperCase
        THEN
          GetLowerCase := Chr(ORD(Letter) + 32)
    ELSE
      GetLowerCase := Letter
  END; {GetLowerCase}

BEGIN {UNIT Word}
END. {UNIT Word}
