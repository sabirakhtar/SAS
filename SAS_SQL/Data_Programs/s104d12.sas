*** s104d12 ***;

proc sql;
select d.Employee_ID, Recipients
   from orion.employee_donations as d 
        left join 
      orion.employee_payroll as p
   on d.Employee_ID= 
      p.Employee_ID
   where marital_status="M";
quit;
