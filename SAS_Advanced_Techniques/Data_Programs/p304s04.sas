 /*  Solution to 4.b. */
options msglevel=i;

data orders(index=(CustomerID OrderID/unique));
   set orion.orders;
   DaysToDeliver=DeliveryDate-OrderDate;
run;

 /*  Solution to 4.d. */
proc sql;
   drop index OrderID
      from orders;
quit;

 /*  Solution to 4.f. */
proc datasets library=work nolist;
   modify orders;
   index create OrDate=(OrderID OrderDate);
quit;

 /*  CONTENTS Solution to 4.h. */
proc contents data=orders;
run;

 /*  DATASETS Solution to 4.h. */
 /*
proc datasets library=work nolist;
   contents data=orders;
quit;
 */

 /*  Solution to 4.i. */
options msglevel=n;
