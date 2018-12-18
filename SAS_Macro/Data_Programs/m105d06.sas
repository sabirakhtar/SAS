*m105d06;

data _null_;
   set orion.country end=no_more;
   call symputx('Country'||left(_n_),country_name);
   if no_more then call symputx('numrows',_n_);
run;

/*
proc sql noprint;
   select country_name into :country1-
      from orion.country;
   %let numrows=&sqlobs;
quit;
*/

%put _user_;
