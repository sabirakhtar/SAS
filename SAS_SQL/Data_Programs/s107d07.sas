*** s107d07 ***;

proc sql;
create view orion.tom_zhou as
   select Employee_Name as Name format=$25.0, 
          Job_Title as Title format=$15.0, 
          Salary 'Annual Salary' format=comma10.2, 
          int((today()-Employee_Hire_Date)/365.25)
             as YOS 'Years of Service'
      from employee_addresses as a,
           employee_payroll as p,
           employee_organization as o
      where a.Employee_ID=p.Employee_ID and
            o.Employee_ID=p.Employee_ID and
            Manager_ID=120102;
quit;
