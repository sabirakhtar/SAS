*** s104s05 **;

proc sql;
title 'Products That Have Not Been Sold';
select Product_Name,
       p.Product_ID,
	   Quantity
   from orion.product_dim as p
        left join
        orion.order_fact as o
        on p.Product_ID=o.Product_ID
   where Order_ID is missing;
quit;
title;
