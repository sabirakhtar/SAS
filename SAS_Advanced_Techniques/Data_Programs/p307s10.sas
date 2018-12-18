proc sql;
   create table agegroups as
   select CustomerID,
          CustomerName,
          int(yrdif(BirthDate, '01Jan2012'd, 'AGE')) as Age,
          Description
   from orion.customer,
        orion.agesmod
   where calculated Age between FirstAge and LastAge
      order by CustomerID;
quit;

proc print data=agegroups(obs=5) noobs;
   title  'agegroups Data Set';
run;

title;
