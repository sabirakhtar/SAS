*m103e03;

proc print data=orion.customer_dim(obs=10);
   var Customer_Name Customer_Group;
	title 'Customer List';
run;
