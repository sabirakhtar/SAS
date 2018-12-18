*m104e07;

%let start=01Jan2011;
%let stop=31Jan2011;

proc means data=orion.order_fact noprint;
   where order_date between "&start"d and "&stop"d;
   var Quantity Total_Retail_Price;
   output out=stats mean=Avg_Quant Avg_Price;
   run;

data _null_;
   set stats;
   call symputx('Quant',put(Avg_Quant,4.2));
   call symputx('Price',put(Avg_Price,dollar7.2));
run;

proc print data=orion.order_fact noobs n;
   where order_date between "&start"d and "&stop"d;
   var Order_ID Order_Date Quantity Total_Retail_Price;
   sum Quantity Total_Retail_Price;
   format Total_Retail_Price dollar6.;
   title1 "Report from &start to &stop";
   title3 "Average Quantity: &quant";
   title4 "Average Price: &price";
run;
