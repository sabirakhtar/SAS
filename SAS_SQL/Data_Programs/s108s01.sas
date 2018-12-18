*** s108s01 ***;  

  /* a. */
proc sql flow=6 35;
title "Dictionary Tables";
select distinct memname,memlabel
   from dictionary.dictionaries;
quit;
title;

  /* b. */
proc sql;
title 'Tables containing Customer_ID';
select Memname, Type, Length
   from dictionary.columns
   where libname="ORION"
         and upcase(Name)="CUSTOMER_ID";
quit;
title;
