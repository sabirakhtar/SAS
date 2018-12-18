*** s107s06 ***; 
 
  /* a. */
proc sql;
create view orion.current_catalog as
/*orion.product_dim includes duplicate records*/
   select distinct d.*,
          round((l.Unit_Sales_Price*
           factor**(year(today())-year(Start_Date))),.01)
           'Current Retail Price' format=dollar13.2 as Price 
   from orion.product_dim as d, 
        orion.price_list as l
   where d.Product_ID=l.Product_ID;
quit;

options nonumber nodate;
  /* b. */
proc sql;
title "Current Roller Skate Prices";
   select Supplier_Name, Product_Name, Price 
      from orion.current_catalog 
      where lowcase(Product_Name) like '%roller skate%'
      order by Supplier_Name, Price;
quit;
title;

  /* c. */
proc sql;
title "2012 prices > $5.00 higher than original price";
select c.Product_Name, Unit_Sales_Price 'Old Price', 
       Price 'New Price', 
       Price-Unit_Sales_Price as Increase format=dollar9.2
   from orion.current_catalog as c,
        orion.price_list as p
   where c.Product_ID=p.Product_id 
         and calculated Increase gt 5
   order by Increase Desc;
quit;
title;
