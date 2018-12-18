*** s105s01 ***;
/* a */

title;
proc sql;
select avg(Total_Retail_Price) as MeanPrice 
   from orion.order_fact
   where Order_Type=1;
quit;

/* b */

title "Customers Whose Average Retail Price";
title2 "Exceeds the Average Retail Price";
title3 "for All Customers";
proc sql;
select Customer_ID, 
       avg(Total_Retail_Price) as MeanPrice format=8.2
   from orion.order_fact
   where Order_Type=1 
   group by Customer_ID
   having MeanPrice >
      (select avg(Total_Retail_Price)
          from orion.order_fact
          where Order_Type=1);
quit;
title;
