*m102d01;

libname orion "&path";

proc freq data=orion.Customer;
   table Country / nocum;
   footnote 'Created &systime &sysday, &sysdate9';
run;

footnote;

***************************************************************;

proc freq data=orion.Customer;
   table Country / nocum;
   footnote "Created &systime &sysday, &sysdate9";
run;

footnote;