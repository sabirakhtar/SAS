data work.ordertype;
	set orion.orders;
	length Method $ 8;
	if Order_Type=1 then Method='Retail';
	else if Order_Type=2 then Method='Catalog';
	else if Order_type=3 then Method='Internet';
	else Method='Unknown';
run;

proc print data=work.ordertype;
	var Order_ID Order_Type Method;
run;
