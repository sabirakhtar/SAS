data work.ordertype;
	set orion.orders;

run;

proc print data=work.ordertype;

run;
