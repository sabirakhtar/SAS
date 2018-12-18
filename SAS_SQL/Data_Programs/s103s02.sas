*** s103s02 ***;

proc sql; 
title "Australian Clothing Products";
select Supplier_Name 'Supplier' format=$18., 
       Product_Group 'Group' format=$12., 
       Product_Name 'Product' format=$30.
   from orion.product_dim
   where Supplier_Country="AU"
         and Product_Category="Clothes"
   order by Product_Name;
quit;
title;
