options fullstimer;

proc sql;
   select EmployeeName,
          sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalContribution,
          Recipients
      from orion.employeeaddresses as a,
           orion.employeedonations as d
         where a.EmployeeID=d.EmployeeID;
quit;

options nofullstimer;
