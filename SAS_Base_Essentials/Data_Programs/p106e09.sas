data work.tony;
   keep Customer_FirstName Customer_LastName; 
   set orion.customer_dim;
   where Customer_FirstName =* 'Tony';
run;

proc print data=work.tony label;
run;
