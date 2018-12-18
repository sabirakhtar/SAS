*** s107d08 ***;

proc sql;
title "Tom Zhou's Direct Reports";
title2 "By Title and Years of Service";
select *
   from orion.tom_zhou
   order by Title desc, YOS desc;
quit;
title;

title "Tom Zhou's Group - Salary Statistics";
proc means data=orion.tom_zhou min mean max;
   var salary;
   class title;
run;
title;
