*m104d05c;

proc sql noprint;
   select distinct country into :countries separated by ', '
      from orion.customer;
quit;

%put &=Countries;

*DATA step version;

proc sort data=orion.customer(keep=country) nodupkey out=allcountries;
   by country;
run;

data _null_;
   set allcountries end=eof;
   length countries $ 50;
   retain countries;
   countries=catx(', ', countries, country);
   if eof then call symputx('countries', countries);
run;

%put &=Countries;
