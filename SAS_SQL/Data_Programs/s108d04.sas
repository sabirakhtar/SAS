*** s108d04 ***;

proc sql inobs=10;
title "orion.price_list - INOBS=10";
select Product_ID, 
       Unit_Cost_price format=comma8.2,
       Unit_Sales_Price format=comma8.2, 
       Unit_Sales_Price-Unit_Cost_Price 
       as Margin format=comma8.2
   from orion.price_list;
quit;
title;
