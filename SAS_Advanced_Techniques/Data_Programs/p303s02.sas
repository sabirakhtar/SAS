options fullstimer;

sasfile orion.employeeaddresses load;
sasfile orion.employeedonations load;

proc sql;
   select EmployeeName, 
          sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalContribution, 
          Recipients
       from orion.employeeaddresses as a, 
            orion.employeedonations as d
       where a.EmployeeID=d.EmployeeID;
quit;

sasfile orion.employeeaddresses close;
sasfile orion.employeedonations close;

options nofullstimer;


