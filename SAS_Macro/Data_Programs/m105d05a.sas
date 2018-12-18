*m105d05a;

%macro customers(place);
   %let place=%upcase(&place);
   %if &place=AU
   or  &place=CA
   or  &place=DE
   or  &place=IL
   or  &place=TR
   or  &place=US
   or  &place=ZA %then %do;
       proc print data=orion.customer;
          var customer_name customer_address country;
          where upcase(country)="&place";
          title "Customers from &place";
       run;
   %end;
   %else %put ERROR: No customers from &place..;
%mend customers;

%customers(de)
%customers(aa)
