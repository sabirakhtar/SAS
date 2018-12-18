 /* DATA Step Merge Solution */
proc sort data=orion.orderfact out=orderfact;
   by CustomerID;
run;

data temp 
     nopurchases(keep=CustomerID CustomerName);
   merge orderfact(in=O)
         orion.customerdim(keep=CustomerID CustomerName in=C);
   by CustomerID;
   if O and C then output temp;
   else if C and not O then output nopurchases;
run;

proc sort data=temp;
   by ProductID;
run;

data purchases(keep=Customerid CustomerName ProductID OrderID Quantity TotalRetailPrice)
     noproducts(keep=ProductID ProductName SupplierName);
   merge temp(in=T)
         orion.productdim(keep=ProductID ProductName
                               SupplierName in=P);
   by ProductID;
   if P and T then output purchases;
   else if P and not T then output noproducts;
run;

proc print data=nopurchases(obs=5) noobs;
   title 'Partial nopurchases Data Set';
run;

proc print data=purchases(obs=5) noobs;
   title 'Partial purchases Data Set';
run;

proc print data=noproducts(obs=5) noobs;
   title 'Partial noproducts Data Set';
run;




 /* PROC SQL Solution */
 /*
proc sql;
   create table nopurchases as
      select CustomerID,
             CustomerName
         from orion.customerdim
         where customerdim.CustomerID not in
              (select CustomerID from orion.orderfact);

   create table noproducts as
      select ProductID, ProductName, SupplierName
         from orion.productdim
         where productdim.ProductID not in
              (select ProductID from orion.orderfact);

   create table purchases as
      select c.Customerid, CustomerName, o.ProductID, OrderID, Quantity, TotalRetailPrice
         from orion.orderfact as o,
              orion.productdim as p,
              orion.customerdim as c
         where o.CustomerID=c.CustomerID
            and o.ProductID=p.ProductID
         order by o.ProductID;

title 'Partial noproducts Data Set';
   select *
      From noproducts(obs=5);

title 'Partial purchases Data Set';
   select *
      From purchases(obs=5);

title 'Partial nopurchases Data Set';
   select *
      From nopurchases(obs=5);
quit;

title;
*/
