proc sql;
   create table percentsql as
   select ManagerID, 
          DeptSal, 
          sum(DeptSal) as GrandTot 'Grand Total',
          DeptSal / calculated GrandTot 
                 as Percent format=percent8.2
   from orion.totalsalaries;

title "Percentsql Data Set";
  select *
     from percentsql(obs=5);
quit;

title;
