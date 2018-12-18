data orders(index=(OrderID/unique CustomerID));
   set orion.orders;
run;

proc contents data=orders centiles;
run;
