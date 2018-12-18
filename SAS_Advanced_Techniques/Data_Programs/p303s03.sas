proc copy in=orion out=work;
   select Sales NonSales;
run; 

sasfile sales load;

proc append base=sales data=nonsales(rename=(First=FirstName
   Last=LastName)) force;
run;

proc print data=sales(firstobs=164 obs=168);
  var EmployeeID FirstName LastName JobTitle;
  title "Work.Sales";
  title2 "Observations 164-168";
run;

sasfile sales close;
