options fullstimer;

sasfile orion.customerdim load;

proc freq data=orion.customerdim;
   tables CustomerCountry CustomerType;
run;

proc print data=orion.customerdim noobs;
    where CustomerType='Orion Club Gold members high activity';
   var CustomerID CustomerName CustomerAgeGroup;
run;

proc means data=orion.customerdim mean median max min;
   var CustomerAge;
   class CustomerGroup;
run;

proc tabulate data=orion.customerdim format=8.;
   class CustomerAgeGroup CustomerType;
   table CustomerType All=Total,
         CustomerAgeGroup*n=' ' All=Total*n=' '/rts=45;
run;

sasfile orion.customerdim close;

options nofullstimer;
