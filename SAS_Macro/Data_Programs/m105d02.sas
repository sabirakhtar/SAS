*m105d02;

%macro count(type=,start=01jan2011,stop=31dec2011);
   proc freq data=orion.order_fact;
      where order_date between "&start"d and "&stop"d;
      tables quantity;
      title1 "Orders from &start to &stop";
      %if &type=  %then %do;
         title2 "For All Order Types";
      %end;
      %else %do;
         title2 "For Order Type &type Only";
         where same and order_type=&type;
      %end;
   run;
%mend count;

options mprint mlogic;

%count()
%count(type=3)
