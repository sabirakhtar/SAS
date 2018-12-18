 /* Part b */
proc sort data=orion.productlist out=productlist;
   by SupplierID;
run;
proc sort data=orion.supplier out=supplier;
   by SupplierID;
run;

data suppliernames1(compress=char);
   merge supplier productlist;
   by SupplierID;
run;

 /* Part c */

data suppliernames2(compress=binary);
   merge supplier productlist;
   by SupplierID;
run;
