options msglevel=i;

proc print data=orion.saleshistory
                (idxname=CustomerID);
   where CustomerID in (14844,4983,
                        5862,10032)   
         and ProductGroup contains 'Shoes';
   var CustomerID ProductID ProductGroup ;
   title 'With an Index';
run;

options msglevel=n;
