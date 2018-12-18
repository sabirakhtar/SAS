*** s106s07 ***;

proc sql;
select count(*) label='No. Customers w/ Orders'
   from (select Customer_ID
            from orion.order_fact
         intersect 
         select Customer_ID
            from orion.customer);
quit;
title;
