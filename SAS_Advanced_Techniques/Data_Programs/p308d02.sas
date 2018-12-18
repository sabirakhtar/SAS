proc sql;
 create table work.empinfo as
 select s.employeeid,
        ReverseName(s.EmployeeName) as FMLName,
        s.jobtitle,
        s.gender,
		e.birthdate,
		e.employeehiredate
from orion.salesstaff as s,
     orion.employeepayroll as e
where s.employeeid=e.employeeid;
quit;

title 'Reverse Names Function in an SQL Step';
proc sql;
  select * from work.empinfo;
quit;
