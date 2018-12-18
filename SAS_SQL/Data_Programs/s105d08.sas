*** s105d08 ***;

proc sql;
select distinct Employee_ID
   from orion.order_fact as of, 
        orion.product_dim as p
   where of.Product_ID=p.Product_ID
         and year(Order_Date)=2011
         and Product_Name contains 'Expedition Zero' 
         and Employee_ID ne 99999999;
quit;
