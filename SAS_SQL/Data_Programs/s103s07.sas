*** s103s07 ***;

proc sql;
title "Countries with More Female than Male Customers";
select Country 'Country', 
       sum(Gender="M") as M "Male Customers", 
       sum(Gender="F") as F "Female Customers" 
   from orion.customer
   group by Country
   having F > M
   order by F desc;
quit;
title;
