********** One-Dimensional Table **********;
proc tabulate data=orion.sales;
   class Country;
   table Country;
run;

********** Two-Dimensional Table **********;
proc tabulate data=orion.sales;
   class Gender Country;
   table Gender, Country;
run;

********** Three-Dimensional Table **********;
proc tabulate data=orion.sales;
   class Job_Title Gender Country;
   table Job_Title, Gender, Country;
run;

********** Dimension Expression **********;
proc tabulate data=orion.sales;
   class Gender Country;
   var Salary;
   table Gender all, Country*Salary;
run;

********** Statistics **********;
proc tabulate data=orion.sales;
   class Gender Country;
   var Salary;
   table Gender all, Country*Salary*(min max);
run;

********** Additional Statements **********;
proc format;
   value $ctryfmt 'AU'='Australia'
                  'US'='United States';
run;

options nodate pageno=1;

ods html file="&path\p1aad15.html";
proc tabulate data=orion.sales;
   class Gender Country;
   var Salary;
   table Gender all, Country*Salary*(min max);
   where Job_Title contains 'Rep';
   label Salary='Annual Salary';
   format Country $ctryfmt.;
   title 'Sales Rep Tabular Report';
run;
ods html close;
title;
