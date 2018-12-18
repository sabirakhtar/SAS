proc format library=orion;
   value $ctryfmt  'AU'='Australia'
                   'US'='United States' 
                  other='Miscoded';
run;

options fmtsearch=(orion);
proc print data=orion.sales;
   var EmployeeID JobTitle Salary 
       Country BirthDate HireDate;
   format Salary dollar10. 
          BirthDate HireDate monyy7.
          Country $ctryfmt.;
run;
