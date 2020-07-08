UNIT SortModule;
INTERFACE
USES
  WordModule;
TYPE
  TreeType = ^WordsStat;
  WordsStat = RECORD //������ ��� ���������� �����
                Word: WordType;
                Quantity: INTEGER;
                LLink, RLink: TreeType
              END;

  PROCEDURE AddWordInTree(VAR Tree: TreeType; WordString: WordType); //���������� ����� � ������
  PROCEDURE PrintTreeStats(VAR FOut: TEXT; Tree: TreeType); //����� ����������
  PROCEDURE CleanTree(Tree: TreeType); //������� ������
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
    THEN  {�������� ��������� �����, �������, ��������� ������}
      BEGIN
        PrintTreeStats(FOut, Tree^.LLink);
        WRITELN(FOut, Tree^.Word, ' ', Tree^.Quantity);
        PrintTreeStats(FOut, Tree^.RLink)
      END
  END; {PrintTreeStats}

  PROCEDURE CleanTree(Tree: TreeType);
  BEGIN {CleanTree}
    IF Tree <> NIL
    THEN  {�������� ��������� �����, �������, ��������� ������}
      BEGIN
        CleanTree(Tree^.LLink);
        CleanTree(Tree^.RLink);
        Dispose(Tree)
      END
  END; {CleanTree}

BEGIN {UNIT SortModule}
END. {UNIT SortModule}
