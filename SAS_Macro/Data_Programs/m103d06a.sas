*m103d06a;

%macro count(opts, start, stop);
   proc freq data=orion.orders;
      where order_date between "&start"d and "&stop"d;
      table order_type / &opts;
      title1 "Orders from &start to &stop";
   run;
%mend count;

options mprint;

%count(nocum,01jan2008,31dec2008)
%count(,01jul2008,31dec2008)

