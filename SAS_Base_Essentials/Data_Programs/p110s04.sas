proc contents data=orion.orders;
run;

proc contents data=orion.order_item;
run;

data work.allorders;
   merge orion.orders 
         orion.order_item;
   by Order_ID;
   keep Order_ID Order_Item_Num Order_Type 
        Order_Date Quantity Total_Retail_Price;
run;

proc print data=work.allorders noobs;
	where Order_Date between '01Oct2011'd and '31Dec2011'd;
run;

  /* alternate solutions */
proc print data=work.allorders noobs;
	where Order_Date>='01Oct2011'd and Order_Date<='31Dec2011'd;
run;

proc print data=work.allorders noobs;
	where qtr(Order_Date)=4 and year(Order_Date)=2011;
run;



