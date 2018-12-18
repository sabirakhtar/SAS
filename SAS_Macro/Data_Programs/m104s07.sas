*m104s07;

*Part A;

%let start=01Jan2011;
%let stop=31Jan2011;

*Part C;

%symdel quant price;

*Part D;

proc sql noprint;
   select mean(Quantity) format=4.2, 
          mean(Total_Retail_Price) format=dollar7.2  
      into :quant, :price
      from orion.order_fact
      where order_date between "&start"d and "&stop"d;
quit;

*Part E;

proc print data=orion.order_fact noobs n;
   where order_date between "&start"d and "&stop"d;
   var Order_ID Order_Date Quantity Total_Retail_Price;
   sum Quantity Total_Retail_Price;
   format Total_Retail_Price dollar6.;
   title1 "Report from &start to &stop";
   title3 "Average Quantity: &quant";
   title4 "Average Price: &price";
run;