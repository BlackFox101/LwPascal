UNIT Queue;
INTERFACE
  PROCEDURE EmptyQ;               {Очистить очередь}
<<<<<<< HEAD
  PROCEDURE AddQ(VAR Element: CHAR);  {Поставить элемент в очередь}
  PROCEDURE DelQ;                 {Убрать первый элемент из очереди}
  PROCEDURE HeadQ(VAR Element: CHAR); {Первый элемент в очереди}
=======
  PROCEDURE AddQ(VAR Elt: CHAR);  {Поставить элемент в очередь}
  PROCEDURE DelQ;                 {Убрать первый элемент из очереди}
  PROCEDURE HeadQ(VAR Elt: CHAR); {Первый элемент в очереди}
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
  PROCEDURE WriteQ;
 
IMPLEMENTATION
VAR
  Queue: TEXT;
 
<<<<<<< HEAD
PROCEDURE Copy(VAR FIn, FOut: TEXT);
=======
PROCEDURE CopyOpen(VAR F1, F2 :TEXT);
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
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
<<<<<<< HEAD
{Queue := <,/,R>}
=======
{Q := <,/,R>}
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
BEGIN {EmptyQ}
  REWRITE(Queue);
  WRITELN(Queue);
  RESET(Queue)
END; {EmptyQ}
 
<<<<<<< HEAD
PROCEDURE AddQ(VAR Element: CHAR); {Поставить элемент в очередь}
  {Queue = <,x/,R>,где x строка И Element = a -->
   Queue = <,xa/,R> }
=======
PROCEDURE AddQ(VAR Elt: CHAR); {Поставить элемент в очередь}
  {Q = <,x/,R>,где x строка И Elt = a -->
   Q = <,xa/,R> }
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
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
<<<<<<< HEAD
  {(Queue = <,/,R> -->)|
   (Queue = <,ax/,R>,где a символ и x строка  -->
     Queue:= <,x/,R> }
=======
  {(Q = <,/,R> -->)|
   (Q = <,ax/,R>,где a символ и x строка  -->
     Q:= <,x/,R> }
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
VAR
  Ch: CHAR;
  Temp: TEXT;
BEGIN {DelQ}
<<<<<<< HEAD
  {удаляем первый элемент из Queue}
  READ(Queue, Ch);
  IF NOT EOF(Queue)
=======
  {удаляем первый элемент из Q}
  READ(Q, Ch);
  IF NOT EOF(Q)
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
  THEN {не пустой}
    BEGIN
      REWRITE(Temp);
      Copy(Queue, Temp);
      WRITELN(Temp);
<<<<<<< HEAD
      {копируем Temp в Queue}
=======
      {копируем Temp в Q}
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
      RESET(Temp);
      REWRITE(Queue);
      Copy(Temp, Queue);
      WRITELN(Queue)
    END;
  RESET(Queue)
END;{DelQ}
 
<<<<<<< HEAD
PROCEDURE HeadQ(VAR Element: CHAR);{Первый элемент в очереди}
  {(Queue = <,/,R> --> Element := '#')|
   (Queue = <,ax/,R>,где a символ и x строка  -->
     Element := 'a' }
=======
PROCEDURE HeadQ(VAR Elt: CHAR);{Первый элемент в очереди}
  {(Q = <,/,R> --> Elt := '#')|
   (Q = <,ax/,R>,где a символ и x строка  -->
     Elt := 'a' }
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
BEGIN {HeadQ}
  IF NOT EOLN(Queue)
  THEN
    READ(Queue, Element)
  ELSE
    Element := '#';
  RESET(Queue)
END;{HeadQ}
 
PROCEDURE WriteQ;
<<<<<<< HEAD
  { (Queue = <,x/,R> и OUTPUT =<y,,W>,где y и x строка  -->
=======
  { (Q = <,x/,R> и OUTPUT =<y,,W>,где y и x строка  -->
>>>>>>> 5d17a72612cba064281908573dcc2e61655938de
     OUTPUT := <y&x/,,W> }
BEGIN {WriteQ}
  Copy(Queue, OUTPUT);
  WRITELN(OUTPUT);
  RESET(Queue)
END;{WriteQ}
 
BEGIN {Queue}
END. {Queue}
