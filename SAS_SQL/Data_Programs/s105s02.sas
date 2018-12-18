*** s105s02 ***;

/* a */
proc sql;
title "Employee IDs for Current Month Anniversaries";
select Employee_ID
   from orion.employee_payroll
   where month(Employee_Hire_Date)=month(today());
quit;
title;

/* b */
proc sql;
title "Employees with Current Month Anniversaries";
select  Employee_ID,
        scan(Employee_Name,2,', ') format=$15. 
           as FirstName 'First Name',
        scan(Employee_Name,1,', ') format=$15. 
           as LastName 'Last Name'
   from orion.employee_addresses
   where Employee_ID in
      (select Employee_ID
          from orion.employee_payroll
          where month(Employee_Hire_Date)=month(today()))
   order by LastName;
quit;
title;
