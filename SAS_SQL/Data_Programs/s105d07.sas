*** s105d07 ***; 

proc sql;
title  'Employees with Salaries less than';
title2 '95% of the Average for their Job';
select Employee_Name, emp.Job_Title, 
       Salary format=comma7., Job_Avg format=comma7.
   from (select Job_Title, 
                avg(Salary) as Job_Avg format=comma7.
            from orion.employee_payroll as p, 
                 orion.employee_organization as o
            where p.Employee_ID=o.Employee_ID
                  and Employee_Term_Date is missing
                  and Department="Sales"
            group by Job_Title) as job,
        orion.salesstaff as emp
   where emp.Job_Title=job.Job_Title
         and Salary<Job_Avg*.95
		 and Emp_Term_Date is missing
   order by Job_Title, Employee_Name;
quit;
title;

