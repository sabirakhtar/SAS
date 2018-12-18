*** s107s04 ***;

  /* a. */
proc sql;
create view orion.phone_list as
   select Department format=$25., 
          Employee_Name as Name format=$25.,
          Phone_Number 'Home Phone' format=$16.
      from orion.employee_addresses as a,
           orion.employee_phones as p,
           orion.employee_organization as o
      where a.Employee_ID=p.Employee_ID and
            o.Employee_ID=p.Employee_ID and
            Phone_Type="Home";
quit;

  /* b. */
proc sql;
title "Engineering Department Home Phone Numbers";
select Name, Phone_Number 
   from orion.phone_list
   where Department="Engineering"
   order by Name;
quit;
title;
