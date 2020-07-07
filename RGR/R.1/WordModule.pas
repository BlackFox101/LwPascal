UNIT WordModule;
INTERFACE
CONST
  RusAndEngAlphabet = ['А' .. 'Я', 'Ё', 'а' .. 'я', 'ё', 'A' .. 'Z', 'a' .. 'z'];
  UpperCase = ['А' .. 'Я', 'Ё', 'A' .. 'Z'];
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
  { Если передана буква в верхнем регистре переделает ее в нижний,
    если 'Ё' и 'ё' => 'е',
    если передана не буква то просто вернет ее}
  BEGIN {GetLowerCase}
    IF Letter IN RusAndEngAlphabet
    THEN
      IF (Letter = 'Ё') OR (Letter ='ё')
      THEN
        GetLowerCase := 'е'
      ELSE
        IF Letter IN UpperCase
        THEN
          GetLowerCase := Chr(ORD(Letter) + 32)
    ELSE
      GetLowerCase := Letter
  END; {GetLowerCase}

BEGIN {UNIT WordModule}
END. {UNIT WordModule}
