UNIT Queue;
INTERFACE
  PROCEDURE EmptyQ;               {Очистить очередь}
  PROCEDURE AddQ(VAR Element: CHAR);  {Поставить элемент в очередь}
  PROCEDURE DelQ;                 {Убрать первый элемент из очереди}
  PROCEDURE HeadQ(VAR Element: CHAR); {Первый элемент в очереди}
  PROCEDURE WriteQ;
 
IMPLEMENTATION
VAR
  Queue: TEXT;
 
PROCEDURE Copy(VAR FIn, FOut: TEXT);
 {копириует строку из F1 в F2 без RESET или REWRITE;
  таким образом F1 должен быть готов для чтения,а F2 для записи,
  но прошлые строки у этих файлов могут быть не пусты }
VAR
  Ch: CHAR;
BEGIN {Copy}
  WHILE NOT EOLN(FIn)
  DO
    BEGIN
      READ(FIn, Ch);
      WRITE(FOut, Ch)
    END
END;{Copy}
 
PROCEDURE EmptyQ; {Очистить очередь}
{Queue := <,/,R>}
BEGIN {EmptyQ}
  REWRITE(Queue);
  WRITELN(Queue);
  RESET(Queue)
END; {EmptyQ}
 
PROCEDURE AddQ(VAR Element: CHAR); {Поставить элемент в очередь}
  {Queue = <,x/,R>,где x строка И Element = a -->
   Queue = <,xa/,R> }
VAR
  Temp: TEXT;
BEGIN {AddQ}
  REWRITE(Temp);
  Copy(Queue, Temp);
  WRITELN(Temp, Element);
  RESET(Temp);
  REWRITE(Queue);
  Copy(Temp, Queue);
  WRITELN(Queue);
  RESET(Queue)
END;{AddQ}
 
PROCEDURE DelQ;{Убрать первый элемент из очереди}
  {(Queue = <,/,R> -->)|
   (Queue = <,ax/,R>,где a символ и x строка  -->
     Queue:= <,x/,R> }
VAR
  Ch: CHAR;
  Temp: TEXT;
BEGIN {DelQ}
  {удаляем первый элемент из Queue}
  READ(Queue, Ch);
  IF NOT EOF(Queue)
  THEN {не пустой}
    BEGIN
      REWRITE(Temp);
      Copy(Queue, Temp);
      WRITELN(Temp);
      {копируем Temp в Queue}
      RESET(Temp);
      REWRITE(Queue);
      Copy(Temp, Queue);
      WRITELN(Queue)
    END;
  RESET(Queue)
END;{DelQ}
 
PROCEDURE HeadQ(VAR Element: CHAR);{Первый элемент в очереди}
  {(Queue = <,/,R> --> Element := '#')|
   (Queue = <,ax/,R>,где a символ и x строка  -->
     Element := 'a' }
BEGIN {HeadQ}
  IF NOT EOLN(Queue)
  THEN
    READ(Queue, Element)
  ELSE
    Element := '#';
  RESET(Queue)
END;{HeadQ}
 
PROCEDURE WriteQ;
  { (Queue = <,x/,R> и OUTPUT =<y,,W>,где y и x строка  -->
     OUTPUT := <y&x/,,W> }
BEGIN {WriteQ}
  Copy(Queue, OUTPUT);
  WRITELN(OUTPUT);
  RESET(Queue)
END;{WriteQ}
 
BEGIN {Queue}
END. {Queue}
