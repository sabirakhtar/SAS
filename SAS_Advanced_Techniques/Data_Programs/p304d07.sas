proc sql;
   drop index CustomerID, ProductGroup, SaleID
      from orion.saleshistory;
quit;

