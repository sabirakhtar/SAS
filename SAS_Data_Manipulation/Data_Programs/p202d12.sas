  /* use OBS= with a WHERE statment*/

proc print data=orion.employee_addresses 
           (obs=10);
   where Country='AU';
   var Employee_Name City Country;
run;
