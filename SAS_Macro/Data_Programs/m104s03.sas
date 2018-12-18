/* m104s03 */

title; 
footnote; 

/* Part A */
proc means data=orion.order_fact nway noprint; 
   var Total_Retail_Price;
   class Customer_ID;
   output out=customer_sum sum=CustTotalPurchase;
run;

proc sort data=customer_sum ;
   by descending CustTotalPurchase;
run;

/* Part B */
data _null_;
   set customer_sum(obs=3) end=last;
   length top3 $50;
   retain top3;
   top3=catx(' ',top3, Customer_ID);
   /* alternative solution using the concatenation operator */
   /* top3=trim(top3)||' '||left(Customer_ID);              */
   if  last then call symputx('top3', top3);
run;

/* Part C */
proc print data=orion.customer_dim noobs;
   where Customer_ID in (&top3);
   var Customer_ID Customer_Name Customer_Type;
   title 'Top 3 Customers';
run;