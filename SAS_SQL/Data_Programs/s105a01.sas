*** s105a01 ***;

proc sql;
select Employee_Name, City, Country
   from orion.employee_addresses
   where Employee_ID in
      (select Employee_ID
          from orion.employee_payroll
          where month(Birth_Date)=2)
   order by 1;
quit;
