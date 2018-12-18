proc sql;
   create index CustomerID
          on orion.saleshistory(CustomerID);
   create index ProductGroup
          on orion.saleshistory(ProductGroup);
   create unique index SaleID
          on orion.saleshistory(OrderID, 
             ProductID);
quit;

