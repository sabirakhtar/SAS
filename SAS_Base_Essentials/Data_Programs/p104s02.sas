proc print data=orion.customer_dim;
run;

proc print data=orion.customer_dim noobs;
	where Customer_Age between 30 and 40; 
run;

proc print data=orion.customer_dim noobs;
	where Customer_Age between 30 and 40;
	id Customer_ID; 
run;

proc print data=orion.customer_dim noobs;
	where Customer_Age between 30 and 40;
	id Customer_ID; 
	var Customer_Name Customer_Age Customer_Type;
run;
