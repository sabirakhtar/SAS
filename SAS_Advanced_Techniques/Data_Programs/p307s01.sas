 /* Merge Solution */
proc sort data=orion.orderfact(keep=CustomerID ProductID)  
          out=orderfact;
   by CustomerID;
run;

data temp;
   merge orderfact(in=O) 
         orion.customerdim(keep=CustomerID CustomerName in=C);
   by CustomerID;
   if O and C;
run;

proc sort data=temp;
   by ProductID;
run;

data purchases;
   keep CustomerName ProductName SupplierName;
   merge temp(in=T) 
         orion.productdim(keep=ProductID ProductName SupplierName in=P);
   by ProductID;
   if P and T;
run;

proc print data=purchases(obs=5) noobs;
   title 'Partial purchases Data Set';
run;

title;

 /* PROC SQL Solution   */
 /*
proc sql;
   create table purchases as
     select CustomerName, 
            ProductName, 
            SupplierName
       from orion.orderfact as o, 
            orion.productdim as p, 
            orion.customerdim as c
	 where o.CustomerID=c.CustomerID 
     and o.ProductID=p.ProductID
      order by o.ProductID;
title 'Partial purchases Data Set';
   reset flow=15 25; 
   select *
      from purchases(obs=5);
title;
quit;
 */

