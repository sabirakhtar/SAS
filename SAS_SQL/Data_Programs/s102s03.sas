*** s102s03 ***;

proc sql;
create table work.bonus as
   select Employee_ID, Salary, 
          Salary * .04 as Bonus
      from orion.employee_payroll;
select * from work.bonus;
quit;
