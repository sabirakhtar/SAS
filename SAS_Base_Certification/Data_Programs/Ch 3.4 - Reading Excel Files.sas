*** Reading Excel Files ***;
libname myxls 'customers.xls';
proc contents data=myxls._all_;
run;
proc print data=myxls.'females$'n;
run;

data work.usfemales;
   set myxls.'females$'n;
   where country='US';
run;
proc print data=work.usfemales;
run;
libname myxls clear;

*** Exercise 4 ***;
libname prod 'products.xls';

proc contents data=prod._all_;
run;

data work.golf;
   set prod.'sports$'n;
   where category='Golf';
run;

libname prod clear;

proc print data=work.golf;
run;
