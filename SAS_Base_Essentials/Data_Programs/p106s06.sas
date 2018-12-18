data work.bigdonations;
   set orion.employee_donations;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
   NumQtrs=n(Qtr1,Qtr2,Qtr3,Qtr4);
   if Total<50 or NumQtrs<4 then delete;
	label Qtr1='First Quarter'
         Qtr2='Second Quarter'
         Qtr3='Third Quarter'
         Qtr4='Fourth Quarter';
	drop Recipients Paid_By;
run;

proc contents data=work.bigdonations;
run;

proc print data=work.bigdonations label noobs;
run;




