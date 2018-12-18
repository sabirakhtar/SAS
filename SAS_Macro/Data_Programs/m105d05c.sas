*m105d05c;

%macro customers(place) / minoperator;
   %let place=%upcase(&place);
   proc sql noprint;
      select distinct country into :list separated by ' '
   		 from orion.customer;
   quit;
   %if &place in &list %then %do;             	
	proc print data=orion.customer;
	   var customer_name customer_address country;
         where upcase(country)="&place";
         title "Customers from &place";
      run;
   %end;
   %else %do;
	  %put ERROR: No customers from &place..;
	  %put ERROR- Valid countries are: &list..;
   %end;
%mend customers;

%customers(de)
%customers(aa)
