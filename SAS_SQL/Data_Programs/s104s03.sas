*** s104s03 ***;  

proc sql;
title  "US and Australian Catalog and Internet Customers";
title2 "Purchasing Foreign Manufactured Products";
select Customer_Name 'Name', Count(*) 'Purchases' 
       as Count
   from orion.product_dim as p,
        orion.order_fact as o,
        orion.customer as c
   where p.Product_ID=o.Product_ID
         and o.Customer_ID=c.Customer_ID
         and Employee_ID=99999999
         and p.Supplier_Country ne Country
         and Country in ('US','AU')
   group by Customer_Name
   order by Count desc, Customer_Name;
quit;
title;
