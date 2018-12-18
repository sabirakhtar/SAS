*** s106s06 ***;

proc sql;
select count(*) label='No. Employees w/ No Charitable Donations'
   from (select Employee_ID
            from orion.employee_organization
         except
         select Employee_ID
            from orion.employee_donations);
quit;
