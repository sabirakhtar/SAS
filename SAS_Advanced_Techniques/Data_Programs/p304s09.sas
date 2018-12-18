/* Step b solution */
proc datasets lib=work nolist;
   modify orders;
      index centiles CustomerID/updatecentiles=1;
	   index centiles CustomerID/refresh;
quit;

/* Step e solution */
proc contents data=orders centiles;
run;

