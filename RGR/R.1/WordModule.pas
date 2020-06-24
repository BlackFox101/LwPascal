UNIT WordModule;
INTERFACE
CONST
  RusAlphabet = ['А' .. 'Я', 'Ё', 'а' .. 'я', 'ё'];
  EngAlphabet = ['A' .. 'Z', 'a' .. 'z'];
  MaxLenghtWord = 50;
TYPE
  WordType = STRING[MaxLenghtWord];

  PROCEDURE GetWord(VAR FIn: TEXT; VAR Word: WordType); // Процедура получения слова
  FUNCTION GetLowerCase(Letter: CHAR): CHAR; // Функция для получения буквы в нижнем регистре
IMPLEMENTATION

PROCEDURE GetWord(VAR FIn: TEXT; VAR Word: WordType);
{ Процедура пропустит не нужные символы и получит слово}
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
{ Если передана буква в верхнем регистре переделает ее в нижний,
  если 'Ё' и 'ё' => 'е',
  если передана не буква то просто вернет ее}
CONST
  UpperCase = ['А' .. 'Я', 'Ё', 'A' .. 'Z'];
BEGIN {GetLowerCase}
  IF (Letter IN RusAlphabet) OR (Letter IN EngAlphabet)
  THEN
    IF Letter IN ['Ё', 'ё']
    THEN
      GetLowerCase := 'е';
    IF Letter IN UpperCase
    THEN
      GetLowerCase := Chr(ORD(Letter) + 32)
  ELSE
    GetLowerCase := Letter
END; {GetLowerCase}

BEGIN {UNIT Word}
END. {UNIT Word}
