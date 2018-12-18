data work.increase;
   set orion.staff;
   Increase=Salary*0.10;
   NewSalary=Salary+Increase;
run;

proc print data=work.increase;
run;




