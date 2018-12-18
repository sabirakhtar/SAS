/*One-to-One Matches*/
data one;
 X=1;Y='a';output;
 X=2;Y='b';output;
run;

data two;
 X=1;Z='f';output;
 X=2;Z='g';output;
run;

data dsthree;
   merge one two;
   by X;
run;

proc sql;
   create table sqlthree as
   select one.X, Y, Z
      from one, two
      where one.X=two.X;
quit;

/*One-to-Many Matches*/
data one;
 X=1;Y='a';output;
 X=2;Y='b';output;
run;

data two;
 X=1;Z='f';output;
 X=1;Z='r';output;
 X=2;Z='g';output;
run;

data dsthree;
   merge one two;
   by X;
run;

proc sql;
   create table sqlthree as
   select one.X, Y, Z
      from one, two
      where one.X=two.X;
quit;

/*Many-to-Many Matches*/
data one;
 X=1;Y='a';output;
 X=1;Y='c';output;
 X=2;Y='b';output;
run;

data two;
 X=1;Z='f';output;
 X=1;Z='r';output;
 X=2;Z='g';output;
run;

data dsthree;
   merge one two;
   by X;
run;

proc sql;
   create table sqlthree as
   select one.X, Y, Z
      from one, two
      where one.X=two.X;
quit;

/*Nonmatches-SQL Inner join*/
data one;
 X=1;Y='a';output;
 X=2;Y='b';output;
 X=3;Y='c';output;
run;

data two;
 X=1;Z='f';output;
 X=3;Z='t';output;
 X=4;Z='w';output;
run;

data dsthree;
   merge one two;
   by X;
run;

proc sql;
   create table sqlthree as
   select one.X, Y, Z
      from one, two
      where one.X=two.X;
quit;

/*Nonmatches-SQL Full outer join*/
data one;
 X=1;Y='a';output;
 X=2;Y='b';output;
 X=3;Y='c';output;
run;

data two;
 X=1;Z='f';output;
 X=3;Z='t';output;
 X=4;Z='w';output;
run;

data dsthree;
   merge one two;
   by X;
run;

proc sql;
  create table sqlthree as
  select coalesce(one.X,two.X) as X, Y, Z
     from one 
       full outer join 
          two
     on one.X=two.X;
quit;

/*7.04 Quiz*/
data one;
  input X Y:$1.;
datalines;
1 a
1 d
4 c
5 g
;
run;

data two;
  input X Z:$1.;
datalines;
1 f
1 r
1 s
3 t
4 w
;
run;

proc sql;
   create table three as
   select one.*, two.Z
      from one, two
      where one.X=two.X;
quit;

proc print data=three;
run;
