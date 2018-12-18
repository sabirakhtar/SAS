 *** s104s07 ***;

proc sql;
title "Employees With More Than 30 Years of Service";
title2 "As of February 1, 2013";
select emp.Employee_Name 'Employee Name' format=$35., 
       int(('1FEB2013'd-Employee_Hire_Date)/365.25)
          as YOS 'Years of Service',
       mgr.Employee_Name 'Manager Name' as Manager_Name
   /* Employee_Addresses: 
      First copy is required to
      look up Employee information Employee's
      Employee_ID */
   /* Employee_Organization: 
      Links Employee_ID to Manager_ID */
   /* Employee_Addresses: 
      Second copy is required to
      look up Manager information using Manager's
      Employee_ID */
   from orion.employee_addresses as emp,
        orion.employee_organization as org,
        orion.employee_payroll as pay,
        orion.employee_addresses as mgr
   where emp.Employee_ID=pay.Employee_ID
         and emp.Employee_ID=org.Employee_ID
         and org.Manager_ID=mgr.Employee_ID
         and calculated YOS gt 30
   order by Manager_Name, YOS desc, Employee_Name;
quit;
title;
