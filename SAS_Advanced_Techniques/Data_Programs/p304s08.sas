options msglevel=i;

proc print data=orion.supplier(idxwhere=no) noobs;
   where SupplierID > 1000;
run;

options msglevel=n;
