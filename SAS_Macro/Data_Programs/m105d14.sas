*m105d14;

%macro numobs(dsn);
   options nonotes;
   data _null_;
    	 call symputx('num', number);
   	 stop;
   	 set &dsn nobs=number;
   run;
   options notes;
%mend numobs;

%numobs(orion.order_fact)
%put --->  &num observations;

%global num;
%numobs(orion.order_fact)
%put --->  &num observations;

%symdel num;

%macro numobs(dsn);
   options nonotes;
   data _null_;
    	 call symputx('num', number,'G');
   	 stop;
   	 set &dsn nobs=number;
   run;
   options notes;
%mend numobs;

%numobs(orion.order_fact)
%put --->  &num observations;

%symdel num;

%macro printds(dsn);
	%let dsn=%upcase(&dsn);
	%numobs(&dsn)
   %if &num > 10 %then %do;
      title "First 10 of &num observations from &dsn";
   %end;
   %else %do;
		title "All &num observations from &dsn";
   %end;
   proc print data=&dsn(obs=10);
   run;
%mend printds;

%printds(orion.orders)
%printds(orion.country)
