*m103d04c;

%macro calc;
   proc means data=&dsn;
	   var &vars;
   run;
%mend calc;

%let dsn=orion.order_fact;
%let vars=quantity;

%calc
%calc;
