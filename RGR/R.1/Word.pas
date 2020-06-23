UNIT Word;
INTERFACE
CONST
  RusAlphabet = ['À' .. 'ß', '¨', 'à' .. 'ÿ', '¸'];
  EngAlphabet = ['A' .. 'Z', 'a' .. 'z'];
TYPE
  WordType = STRING[50];

  PROCEDURE GetWord(VAR FIn: TEXT; VAR Word: WordType);
IMPLEMENTATION

PROCEDURE GetWord(VAR FIn: TEXT; VAR Word: WordType);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      READ(FIn, Ch);
      Word := Ch
    END;
  WHILE NOT EOLN(FIn) AND ((Ch IN RusAlphabet) OR (Ch IN EngAlphabet))
  DO
    BEGIN
      READ(FIn, Ch);
      Word := Word + Ch
    END;
END;

BEGIN {UNIT Word}
END. {UNIT Word}
