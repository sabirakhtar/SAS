data work.subset1;
	set orion.sales;
	where Country='AU' and
         Job_Title contains 'Rep';
	Bonus=Salary*.10;
	drop Employee_ID Gender Country Birth_Date;
run;

proc print data=work.subset1;
run;


