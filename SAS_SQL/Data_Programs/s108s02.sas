*** s108s02 ***;

  /* a. */
proc sql flow=6 35;
title "Dictionary Tables";
select Memname as Table, Memlabel as Contents,
       count(*) as Columns
   from dictionary.dictionaries
   group by Table, Contents;
quit;
title;

  /* b. */
proc  sql flow=6 35;
title 'Orion Library Tables';
select memname "Table",
       nobs "Rows",
       nvar "Columns", 
       filesize "File Size", 
       maxvar 'Widest Column',
       maxlabel 'Widest Label'
   from dictionary.tables
   where libname='ORION'
         and memtype ne 'VIEW'
   order by memname;
quit;
title;
