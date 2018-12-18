*** PROC SORT ***;
*** Exercise 4 ***;
proc sort data=sashelp.shoes 
          out=shoes;
   by descending region product;
run;

proc sort data=sashelp.shoes 
          out=shoes;
   by descending region ascending product;
run;
proc print data=shoes;
run;

proc sort data=sashelp.shoes 
          out=shoes;
   by descending region product;
run;
data new;
   set shoes;
   by descending region product;
run;

proc sort data=one;
   by id;
run;
proc sort data=two;
   by id;
run;
data both;
   merge one two;
   by id;
run;

proc sort data=personnel;
   by descending empid lastname;
run;
proc print data=personnel;
   by descending empid;
run;

