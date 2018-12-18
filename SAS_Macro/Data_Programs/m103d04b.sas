*m103d04b;

%macro calc;
   proc means data=
%mend calc;

%calc
orion.order_fact;
run;

%calc;
orion.order_fact;
run;
