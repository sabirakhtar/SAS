*** s106s05 ***;

proc sql;
title 'Customers Who Placed Orders';
select Customer_ID
   from orion.order_fact
intersect 
select Customer_ID
   from orion.customer;
quit;
title;
