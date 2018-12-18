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
 /* Part 4.d.1) */
data rdu;
   set orion.saleshistory;
   where OrderID=1230166613;
run;
 /* Part 4.d.2) */
proc print data=orion.saleshistory;
   where OrderID=1230166613 and ProductID=220200100100;
run;
 /* Part 4.d.3) */
proc print data=orion.saleshistory;
   where ProductGroup = 'Shoes';
run;
 /* Part 4.d.4) */
proc print data=orion.saleshistory(idxwhere=no);
   where CustomerID=12727;
run;
/* Part 4.d.5) */
data saleshistorycopy;
   set orion.saleshistory;
run;
options msglevel=n;
