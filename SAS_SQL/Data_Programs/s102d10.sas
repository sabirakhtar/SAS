*** s102d10 ***;

proc sql;
select Employee_ID,  Birth_Date, 
       month(Birth_Date) as Birth_Month, 
       Employee_Gender
   from orion.employee_information;
quit;
