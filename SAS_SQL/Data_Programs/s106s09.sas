*** s106s09 ***;

proc sql;
title 'Name of Customers Who Placed Orders';
select Customer_ID, Customer_Name
   from orion.customer
   where Customer_id in
      (select Customer_ID
          from orion.order_fact
       intersect 
       select Customer_ID
          from orion.customer);
quit;
title;
