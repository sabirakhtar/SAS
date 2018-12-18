data bonusview(keep=ManagerID YrEndBonus)
     / view=bonusview;
   set orion.staff;
   YrEndBonus=Salary * 0.05;
   where JobTitle contains 'Manager';
run;

proc means data=bonusview mean sum;
   class ManagerID;
   var YrEndBonus;
run;
