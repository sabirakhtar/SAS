*** s104s04 ***;

proc sql;
select Employee_Name 'Name' format=$35., 
       City, Job_Title
   from orion.employee_addresses as a
        left join 
        orion.sales as s
	    on a.Employee_ID=s.Employee_ID
   order by City, Job_Title, Employee_Name;
quit;
