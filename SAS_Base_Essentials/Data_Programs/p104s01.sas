proc print data=orion.order_fact;
   sum Total_Retail_Price;
run;

proc print data=orion.order_fact;
	where Total_Retail_Price>500;
   sum Total_Retail_Price;
run;

proc print data=orion.order_fact noobs;
	where Total_Retail_Price>500;
   sum Total_Retail_Price;
run;

proc print data=orion.order_fact noobs;
	where Total_Retail_Price>500;
	id customer_id;
   sum Total_Retail_Price;
run;

proc print data=orion.order_fact noobs;
	where Total_Retail_Price>500;
	id customer_id;
	var Customer_ID Order_ID Order_Type Quantity Total_Retail_Price;
   sum Total_Retail_Price;
run;

proc print data=orion.order_fact noobs;
	where Total_Retail_Price>500;
	id customer_id;
	var Order_ID Order_Type Quantity Total_Retail_Price;
   sum Total_Retail_Price;
run;

