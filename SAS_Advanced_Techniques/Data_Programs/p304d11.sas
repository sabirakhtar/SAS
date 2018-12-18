options msglevel=i;

proc sort data=orion.saleshistory
          out=salessorted(index=(CustomerID));
   by CustomerID ProductID;
run;

options msglevel=n;

