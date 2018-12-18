options msglevel=n;
proc datasets library=orion nolist;
   modify saleshistory;
     index create CustomerID;
     index create ProductGroup;
     index create SaleID=(OrderID ProductID)/unique;
quit;