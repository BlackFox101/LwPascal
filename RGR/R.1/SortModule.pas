UNIT SortModule;
INTERFACE
USES
  WordModule;
TYPE
  TreeType = ^WordsStat;
  WordsStat = RECORD //Запись для статистики слова
                Word: WordType;
                Quantity: INTEGER;
                LLink, RLink: TreeType
              END;

  PROCEDURE AddWordInTree(VAR Tree: TreeType; WordString: WordType); //Добавление слово в дерево
  FUNCTION CompareWords(FirstWord, SecondWord: WordType): BOOLEAN; //Сравнение двух строк
  FUNCTION IsExistWordInTree(VAR Tree: TreeType; Word: WordType): BOOLEAN; //Проверка есть ли слово в дереве
IMPLEMENTATION
  PROCEDURE AddWordInTree(VAR Tree: TreeType; WordString: WordType);
  BEGIN {AddWordInTree}
    IF Tree = NIL
    THEN
      BEGIN
        NEW(Tree);
        Tree^.Word := WordString;
        Tree^.Quantity := 1;
        Tree^.LLink := NIL;
        Tree^.RLink := NIL
      END
    ELSE
      IF CompareWords(Tree^.Word, WordString){Tree^.Word >= WordString}
      THEN
        AddWordInTree(Tree^.LLink, WordString)
      ELSE
        AddWordInTree(Tree^.RLink, WordString)
  END; {Insert}

  FUNCTION CompareWords(FirstWord, SecondWord: WordType): BOOLEAN;
  VAR
    I, MinLengthWord, Temp: INTEGER;
  BEGIN
    Temp := 2;
    CompareWords := FALSE;
    IF Length(FirstWord) < Length(SecondWord)
    THEN
      MinLengthWord := Length(FirstWord)
    ELSE
      MinLengthWord := Length(SecondWord);
    FOR I := 1 TO MinLengthWord
    DO
      BEGIN
        IF FirstWord[I] > SecondWord[I]
        THEN
          BEGIN
            CompareWords := TRUE;
            Exit
          END;
        IF FirstWord[I] < SecondWord[I]
        THEN
          BEGIN
            CompareWords := FALSE;
            Exit
          END;
        IF (FirstWord[I] = SecondWord[I]) AND (I = MinLengthWord) AND (Length(FirstWord) < Length(SecondWord))
        THEN
          CompareWords := FALSE;
        IF (FirstWord[I] = SecondWord[I]) AND (I = MinLengthWord) AND (Length(FirstWord) > Length(SecondWord))
        THEN
          CompareWords := TRUE
      END
  END;

  FUNCTION IsExistWordInTree(VAR Tree: TreeType; Word: WordType): BOOLEAN;
  BEGIN
    IsExistWordInTree := FALSE;
    IF Tree <> NIL
    THEN
      IsExistWordInTree := (Tree^.Word = Word) OR IsExistWordInTree(Tree^.LLink, Word) OR IsExistWordInTree(Tree^.RLink, Word)
  END;

BEGIN {UNIT SortModule}
END. {UNIT SortModule}
