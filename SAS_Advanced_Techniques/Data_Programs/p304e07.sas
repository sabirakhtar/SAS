options msglevel=I;
 /*  Run this DATASETS step if indexes need to be created */
 /*
proc datasets lib=orion nolist;
   modify saleshistory;
      index delete orderid;
      index delete productgroup;
      index delete saleid;
      index create orderid;
      index create productgroup;
      index create saleid=(OrderID ProductID)/unique;
quit;
 */

*** Example 1;
data rdu;
   set orion.saleshistory;
   if OrderID=1230166613;
run;
*** Example 2;
proc print data=orion.saleshistory;
   where OrderID=1230166613 or ProductID=220200100100;
run;
*** Example 3;
proc print data=orion.saleshistory;
   where ProductGroup ne 'Shoes';
run;
*** Example 4;
proc print data=orion.saleshistory;
   where CustomerID=12727;
run;
**** Example 5;
data saleshistorycopy;
   set orion.saleshistory;
run;
options msglevel=n;
