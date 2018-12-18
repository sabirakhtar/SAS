*** s104d00b ***;

proc sql;
create table work.customer2
   (ID num, Name CHAR(5));
insert into work.customer2
   values(101,'Jones')
   values(101,'Jones')
   values(102,'Kent')
   values(102,'Kent')
   values(104,'Avery');
create table work.transaction2
   (ID num, Action CHAR(10), Amount num format=dollar5.);
insert into work.transaction2
   values(102,'Purchase', 376)
   values(102,'Return', 119)
   values(103,'Purchase', 57)
   values(105,'Purchase', 98);
quit;
