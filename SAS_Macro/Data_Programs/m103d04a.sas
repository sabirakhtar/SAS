*m103d04a;

options mprint;

%macro calc;
   proc means data=orion.order_fact;
   run;
%mend calc;

%calc

