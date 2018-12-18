*m102d05a;

data orders;
	set orion.Orders;
	where year(Order_Date)=2011;
	Lag=Delivery_Date - Order_Date;
run;

proc means data=orders maxdec=2 min max mean;
	class Order_Type;
	var Lag;
	title "Report based on ORDERS data";
run;