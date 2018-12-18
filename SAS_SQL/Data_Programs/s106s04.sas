*** s106s04 ***;

proc sql;
title "Employee IDs with Phone Numbers But Not Address Information";
select Employee_ID 
   from orion.employee_phones
except 
select Employee_ID 
   from orion.employee_addresses;
quit;
title;

   /* Alternative Solution using the CORR modifier */
proc sql;
title "Employee IDs with Phone Numbers But Not Address Information";
select *
   from orion.employee_phones
except corr 
select *
   from orion.employee_addresses;
quit;
title;
