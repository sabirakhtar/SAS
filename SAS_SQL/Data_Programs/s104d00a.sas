*** s104d00a ***;

proc sql;
create table work.customers
   (ID num, Name CHAR(5));
insert into work.customers
   values(101,'Smith')
   values(104,'Jones')
   values(102,'Blank');
create table work.transactions
   (ID num, Action CHAR(10), Amount num format=dollar5.);
insert into work.transactions
   values(102,'Purchase',100)
   values(103,'Return',52)
   values(105,'Return',212);
describe table work.customers;
describe table work.transactions;
quit;


