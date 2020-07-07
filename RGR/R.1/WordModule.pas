UNIT WordModule;
INTERFACE
CONST
  RusAndEngAlphabet = ['�' .. '�', '�', '�' .. '�', '�', 'A' .. 'Z', 'a' .. 'z'];
  UpperCase = ['�' .. '�', '�', 'A' .. 'Z'];
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
  BEGIN {GetWord}
    Word := '';
    IF NOT EOF(FIn)
    THEN
      BEGIN
        READ(FIn, Letter);
        IF (Letter IN RusAlphabet) OR (Letter IN EngAlphabet)
        THEN
          Word := Word + GetLowerCase(Letter)
      END;
    WHILE (NOT EOLN(FIn)) AND (NOT EOF(FIn)) AND ((Letter IN RusAlphabet) OR (Letter IN EngAlphabet))
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
  BEGIN {GetLowerCase}
    IF Letter IN RusAndEngAlphabet
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

BEGIN {UNIT WordModule}
END. {UNIT WordModule}
