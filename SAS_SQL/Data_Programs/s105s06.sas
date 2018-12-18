*** s105s06 ***;  

  /* a */
proc sql;
select Department, sum(Salary) as Dept_Salary_Total
   from orion.employee_payroll as pay,
        orion.employee_organization as org
   where org.Employee_ID=pay.Employee_ID
   group by Department;
quit;

  /* b */
proc sql;
select adr.Employee_ID, Employee_Name, org.Department
   from orion.employee_addresses as adr,
        orion.employee_organization as org
   where adr.Employee_ID=org.Employee_ID;
quit;

  /* c */
proc sql;
title "Employee Salaries as a Percent of Department Total";
select emp.Department format=$22., 
       emp.Employee_Name format=$28., 
       Salary format=comma9.2,
       Salary/Dept_Salary_Total as Percent
        format=percent6.2
   from orion.employee_payroll as pay,
       /* In-line View: Employee ID, name and department */
        (select adr.Employee_ID, Employee_Name,
                org.Department
            from orion.employee_addresses as adr,
                 orion.employee_organization as org
            where adr.Employee_ID=org.Employee_ID) 
            as emp,
        /* In-line View: Aggregate sum of salary by department */
        (select Department, sum(Salary) as Dept_Salary_Total
            from orion.employee_payroll as pay,
                 orion.employee_organization as org
            where org.Employee_ID=pay.Employee_ID
            group by Department) 
            as sum
   where sum.Department=emp.Department and 
         pay.Employee_ID=emp.Employee_ID
   order by Department, Percent desc;
quit;
title;
