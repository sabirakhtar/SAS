proc sql;
   create view orion.namesview as
   select e.EmployeeID, e.EmployeeName,
          s.ManagerID, 
          m.EmployeeName as ManagerName
       from orion.staff as s, 
            orion.employeeaddresses as e,
	          orion.employeeaddresses as m
       where e.EmployeeID=s.EmployeeID
         and m.EmployeeID=s.ManagerID;
quit;
