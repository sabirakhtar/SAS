*** s105s05 ***; 

  /* a */
  /* Summarizing by employee */
proc sql;
title "2011 Sales Force Sales Statistics";
title2 "For Employees With $200.00 or More In Sales";
select Country, First_Name, Last_Name, 
       sum(Total_Retail_Price) as Value_Sold format=comma9.2, 
       count(distinct Order_ID) as Orders,
       calculated Value_Sold / calculated Orders as Avg_Order
          format=comma7.2
   from orion.order_fact as of,
        orion.sales as s
   where of.Employee_ID=s.Employee_ID
         and year(Order_Date)=2011
   group by Country, First_Name, Last_Name
   having Value_Sold ge 200
   order by Country, Value_Sold desc, Orders desc;
quit;
  /* b */
  /* Further summarize by country using 
     the query from part a. as an in-line view */

proc sql;
title "2011 Sales Summary By Country";
select Country, 
       max(Value_Sold) 'Max Value Sold' format=comma9.2, 
       max(Orders) 'Max Orders' format=comma7.2, 
       max(Avg_Order) 'Max Average' format=comma7.2, 
       min(Avg_Order) 'Min Average' format=comma7.2
        /* Begin in-line view */      
   from (select Country, First_Name, Last_Name, 
                sum(Total_Retail_Price) as Value_Sold, 
                count(distinct Order_ID) as Orders,
                calculated Value_Sold / calculated Orders
                   as Avg_Order
            from orion.order_fact as of,
                 orion.sales as s
            where of.Employee_ID=s.Employee_ID
                and year(Order_Date)=2011
            group by Country, First_Name, Last_Name
            having Value_Sold ge 200) /* End in-line view */
   group by Country
   order by Country;
quit;
title;
