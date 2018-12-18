proc summary data=orion.totalsalaries;
   var DeptSal;
   output out=summary sum=GrandTot;
run;
proc sql;
   create table percentsql as
   select ManagerID, 
          DeptSal, 
          GrandTot 'Grand Total',
          DeptSal / GrandTot 
                 as Percent format=percent8.2
   from orion.totalsalaries,
        summary;

title "Percentsql Data Set";
  select *
     from percentsql(obs=5);
quit;

title;
