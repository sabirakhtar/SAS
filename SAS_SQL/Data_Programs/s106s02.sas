*** s106s02 ***;

proc sql;
title 'First and Second Quarter 2011 Sales';
select *
   from orion.Qtr1
outer union corr
select *
   from orion.Qtr2;
quit;
title;
