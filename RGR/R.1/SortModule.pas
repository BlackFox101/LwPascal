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
  PROCEDURE PrintTreeStats(VAR FOut: TEXT; Tree: TreeType); //Вывод статистики
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
      IF Tree^.Word = WordString
      THEN
        Tree^.Quantity := Tree^.Quantity + 1
      ELSE
        IF Tree^.Word >= WordString
        THEN
          AddWordInTree(Tree^.LLink, WordString)
        ELSE
          AddWordInTree(Tree^.RLink, WordString)
  END; {AddWordInTree}

  PROCEDURE PrintTreeStats(VAR FOut: TEXT; Tree: TreeType);
  BEGIN {PrintTreeStats}
    IF Tree <> NIL
    THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTreeStats(FOut, Tree^.LLink);
      WRITELN(FOut, Tree^.Word, ' ', Tree^.Quantity);
      PrintTreeStats(FOut, Tree^.RLink);
      Dispose(Tree);
    END
  END; {PrintTreeStats}

BEGIN {UNIT SortModule}
END. {UNIT SortModule}
