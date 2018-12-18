*** s108d03 ***;

  /*****************************************************
  CORRECT SOLUTION * CORRECT SOLUTION * CORRECT SOLUTION 
  *****************************************************/
proc sql outobs=10;
title "10 Most Profitable Customers";
select Customer_ID, sum(Unit_Sales_Price-Unit_Cost_Price)
       as Profit_2011 format=comma8.2
   from orion.price_list as p,
        orion.order_fact as o
   where p.Product_ID=o.Product_id
         and year(Order_date)=2011
   group by Customer_ID
   order by Profit_2011 desc;
quit;
title;

  /*****************************************************
  ** INCORRECT ** INCORRECT ** INCORRECT ** INCORRECT **
  INOBS option doesn't work here; not enough rows are 
  read in to produce a result.  We should process ALL
  rows and limit the rows OUTPUT.
  ** INCORRECT ** INCORRECT ** INCORRECT ** INCORRECT **
  *****************************************************/

proc sql inobs=10;
title "10 Most Profitable Customers - join with INOBS=10";
title2 "This report didn't work!";
select Customer_ID, sum(Unit_Sales_Price-Unit_Cost_Price) 
       as Profit_2011 format=comma8.2
   from orion.price_list as p,
        orion.order_fact as o
   where p.Product_ID=o.Product_id
         and year(Order_date)=2011
   group by Customer_ID
   order by Profit_2011 desc;
quit;
title;



