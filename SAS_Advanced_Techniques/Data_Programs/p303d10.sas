/*some datasets do not compress well*/
data orders(compress=binary);
   set orion.orders;
run;

/*some datasets do*/
data CustDimComp(compress=binary);
 set orion.Customerdimmore;
run;
