 /* Program #1 */
data bonus;
   set orion.staff;
   YrEndBonus=Salary*0.05;
run;

proc means data=bonus mean sum;
   where JobTitle contains 'Manager';
   class ManagerID;
   var YrEndBonus;
run;

 /* Program #2 */
data bonus(keep=ManagerID YrEndBonus);
   set orion.staff(keep=JobTitle Salary ManagerID);
   where JobTitle contains 'Manager';
   YrEndBonus=Salary*0.05;
run;

proc means data=bonus mean sum;
   class ManagerID;
   var YrEndBonus;
run;
