proc print data=orion.order_fact;
   where year(order_date)=2007;
   title "Orders for 2007";
run;

proc means data=orion.order_fact mean;
   where year(order_date)=2007;
   class order_type;
   var total_retail_price;
   title "Average Retail Prices for 2007 Orders";
   title2 "by Order_Type";
run;
title;
