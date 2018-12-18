*** s105s04 ***;

title 'Latest Order Date for';
title2 'Orion Club Low Activity Members';
proc sql;
select distinct Customer_ID,
       max(Order_Date) 'Order Date' format=date11.
   from orion.order_fact
   where Order_Date < '01Jan2012'd and 
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

/* alternate solution */

title 'Inner Join with In-Line View';
proc sql;
select c.Customer_ID,
       Date
   from orion.customer_type as t,
        orion.customer as c,
        (select Customer_ID, max(Order_Date) format=date11. as Date
            from orion.order_fact
            where Order_Date < '01JAN2012'd
            group by 1) as of
   where t.Customer_Type_ID=c.Customer_Type_ID
     and c.Customer_ID=of.Customer_ID
     and Customer_Type='Orion Club members low activity';
quit;
title;
