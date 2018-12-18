* m104e02;

title; 
footnote; 

*part a;

proc means data=orion.order_fact sum nway noprint; 
   var Total_Retail_Price;
   class Customer_ID;
   output out=customer_sum sum=CustTotalPurchase;
run;

proc sort data=customer_sum ;
   by descending CustTotalPurchase;
run;

proc print data=customer_sum(drop=_type_);
run;
 
*part b;

proc print data=orion.orders noobs;
   var Order_ID Order_Type Order_Date Delivery_Date;
run;
