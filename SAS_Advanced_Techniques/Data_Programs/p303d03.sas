 /* Program 1 */
data bigsalaries;
   set orion.staff;
   where Salary > 50000;
run;

proc means data=bigsalaries mean sum;
   class ManagerID;
   var Salary;
run;

 /* Program 2 */
proc means data=orion.staff mean sum;
   class ManagerID;
   var Salary;
   where Salary > 50000;
run;
