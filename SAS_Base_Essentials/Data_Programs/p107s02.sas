options validvarname=v7;
*libname prod excel "&path\products.xlsx";
*libname prod pcfiles path="&path\products.xlsx";

proc contents data=prod._all_;
run;

data work.golf;
   set prod.'sports$'n;
   where Category='Golf';
   drop Category;
   label Name='Golf Products';
run;

libname prod clear;

proc print data=work.golf label;
run;

/* Alternate solution */

options validvarname=v7;
libname prod xlsx "&path\products.xlsx";

proc contents data=prod._all_;
run;

data work.golf;
   set prod.sports;
   where Category='Golf';
   drop Category;
   label Name='Golf Products';
run;

libname prod clear;

proc print data=work.golf label;
run;
