UNIT StatsModule;
INTERFACE
USES
  SortModule, WordModule;

  PROCEDURE IncrementWordQuantity(VAR Tree: TreeType; Word: WordType); //��������� ���-�� ����
  PROCEDURE PrintTreeStats(VAR FOut: TEXT; Tree: TreeType); //����� ����������
IMPLEMENTATION
  PROCEDURE IncrementWordQuantity(VAR Tree: TreeType; Word: WordType);
  BEGIN
    IF Tree <> NIL
    THEN
      IF Tree^.Word = Word
      THEN
        Tree^.Quantity := Tree^.Quantity + 1
      ELSE
        BEGIN
          IncrementWordQuantity(Tree^.LLink, Word);
          IncrementWordQuantity(Tree^.RLink, Word)
        END
  END;

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

BEGIN {UNIT StatsModule}
END. {UNIT StatsModule}
