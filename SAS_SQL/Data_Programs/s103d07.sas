*** s103d07 ***;

proc sql;
select sum(Qtr1) 
       'Total Quarter 1 Donations'
   from orion.employee_donations;
quit;

proc means data=orion.employee_donations 
           sum maxdec=0;
   var Qtr1;
run;
