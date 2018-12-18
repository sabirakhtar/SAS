proc datasets library=orion nolist;
   modify saleshistory;
      index delete CustomerID
            ProductID SaleID;
quit;

