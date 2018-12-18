*** s105d03 ***;

title 'Latest Order Date for';
title2 'Orion Club Low Activity Members';
proc sql;
select Customer_ID,
       max(Order_Date) 'Order Date' format=date11.
   from orion.order_fact
   where  Order_Date < '1Jan2010'd and 
          Customer_ID in 
          (select Customer_ID 
              from orion.customer
              where Customer_Type_ID =
                 (select Customer_Type_ID
	                 from orion.customer_type
	                 where Customer_Type = 
                     'Orion Club members low activity'))
   group by Customer_ID;
quit;
title;
