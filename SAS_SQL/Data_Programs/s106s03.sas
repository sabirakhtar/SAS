*** s106s03 ***;

  /* a */
proc sql;
title 'Results with UNION operator ';
select *
   from orion.qtr1
union
select *
   from orion.qtr2;
quit;
title;

 /* b */
options ls=140;
proc sql;
title 'Results with OUTER UNION operator ';
select *
   from orion.qtr1
outer union 
select *
   from orion.qtr2;
quit;
title;

/* c - NO*/

/* d - NO*/
proc sql;
title 'Results with  UNION  operator and CORR modifier ';
select *
   from orion.qtr1
union corr 
select *
   from orion.qtr2;
quit;
title;


proc sql;
title 'Results with  OUTER UNION  operator and CORR modifier ';
select *
   from orion.qtr1
outer union corr 
select *
   from orion.qtr2;
quit;
title;
