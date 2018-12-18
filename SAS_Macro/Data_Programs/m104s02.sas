/* m104s02 */
title; 
footnote; 

/* Part A */

proc means data=orion.order_fact sum nway noprint; 
   var Total_Retail_Price;
   class Customer_ID;
   output out=customer_sum sum=CustTotalPurchase;
run;

proc sort data=customer_sum ;
   by descending CustTotalPurchase;
run;

/* Part B */

data _null_;
   set customer_sum (obs=1);
   call symputx('top', Customer_ID);   
run;

proc print data=orion.orders noobs;
   where Customer_ID =&top;
   var Order_ID Order_Type Order_Date Delivery_Date;
   title "Orders for Customer &top - Orion's Top Customer";
run;


/* Part C */

data _null_;
   set customer_sum (obs=1);
   call symputx('top', Customer_ID);   
run;

data _null_;
   set orion.customer_dim;
   where Customer_ID = &top;
   call symputx('topname', Customer_Name);
run;

proc print data=orion.orders noobs;
   where Customer_ID =&top;
   var Order_ID Order_Type Order_Date Delivery_Date;
   title "Orders for Customer &topname - Orion's Top Customer";
run;