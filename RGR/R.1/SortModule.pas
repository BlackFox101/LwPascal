UNIT SortModule;
INTERFACE
USES
  WordModule;
TYPE
  Tree = ^WordsStat;
  WordsStat = RECORD //Запись для статистики слова
                Word: WordType;
                Quantity: INTEGER;
                LLink, Rlink: Tree
              END;

IMPLEMENTATION

BEGIN {UNIT SortModule}
END. {UNIT SortModule}