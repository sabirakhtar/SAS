data future_expenses;
   drop start stop; 
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   start=year(today())+1;
   stop=start+9;
  /* insert a DO loop here */
run;
proc print data=future_expenses;
   format wages retire medical total_cost comma14.2;
   var year wages retire medical total_cost;
run;
