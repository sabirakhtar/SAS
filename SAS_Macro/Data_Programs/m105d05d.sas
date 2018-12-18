*m105d05d;

%macro customers(place);
   %let place=%upcase(&place);
   proc sql noprint;
      select distinct country into :list separated by '*'
         from orion.customer;
   quit;
   %if %index(*&list*,*&place*) > 0 %then %do;
      proc print data=orion.customer;
         var customer_name customer_address country;
         where upcase(country)="&place";
         title "Customers from &place";
      run;
   %end;
   %else %do;
      %put Sorry, no customers from &place..;
      %put Valid countries are: &list..;
   %end;
%mend customers;

%customers(de)
%customers(a)
