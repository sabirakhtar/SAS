options msglevel=n;

proc datasets library=orion nolist;
   modify saleshistory;
      index create CustomerID;
      index create ProductID;
      index create SaleID=(OrderID 
                   ProductID)/unique;
quit;
