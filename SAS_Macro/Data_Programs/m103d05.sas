*m103d05;

%macro calc(dsn,vars);
   proc means data=&dsn;
      var &vars;
   run;
%mend calc;

%calc(orion.order_fact,quantity)
