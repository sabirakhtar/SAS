*** s107d01 ***;

proc sql;
create table orion.birthmonths as
select  Employee_Name as Name format=$25.,
        City format=$25.,
        month(Birth_Date) as BirthMonth
          'Birth Month' format=3.
   from orion.employee_payroll as p,
        orion.employee_addresses as a
   where p.Employee_ID=
         a.Employee_ID 
		 and Employee_Term_Date is missing
   order by BirthMonth,City,Name;
quit;

proc sql;
describe table orion.birthmonths;
select * from orion.birthmonths;
quit;
