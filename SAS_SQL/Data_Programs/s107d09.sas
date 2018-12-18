*** s107d09 ***;

libname orion 'c:\temp';
proc sql;
title "Tom Zhou's Direct Reports";
title2 "By Title and Years of Service";
select *
   from orion.tom_zhou
   order by Title desc, YOS desc;
title;
quit;

title "Tom Zhou's Group - Salary Statistics";
proc means data=orion.tom_zhou min mean max;
   var salary;
   class title;
run;
title;


libname orion clear;

libname orion "&path";
