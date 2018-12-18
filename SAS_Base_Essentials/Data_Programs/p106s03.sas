data work.tony;
   set orion.customer_dim;  
   where Customer_FirstName =* 'Tony';
run;

proc print data=work.tony;
	var Customer_FirstName Customer_LastName;
run;
