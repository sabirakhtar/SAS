proc sort data=orion.orderfact out=orderfact;
   by CustomerID;
run;


/*add DATA step merge code here*/





proc print data=nopurchases(obs=5) noobs;
   title 'Partial nopurchases Data Set';
run;

proc print data=purchases(obs=5) noobs;
   title 'Partial purchases Data Set';
run;

proc print data=noproducts(obs=5) noobs;
   title 'Partial noproducts Data Set';
run;
