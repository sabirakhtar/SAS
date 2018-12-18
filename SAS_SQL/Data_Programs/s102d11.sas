*** s102d11 ***;

proc sql;
create table work.birth_months as
select Employee_ID,  Birth_Date, 
       month(Birth_Date) as Birth_Month, 
       Employee_Gender
   from orion.employee_information;
describe table work.birth_months;
select * from work.birth_months;
quit;
