proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

title 'Revenue from All Orders';
proc means data=orion.order_fact sum;
   var Total_Retail_Price;
   class Order_Date Order_Type;
   format Order_Date year4. Order_Type ordertypes.;
run;
title;
