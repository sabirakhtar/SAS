data work.price_increase;
   set orion.prices;
run;
proc print data=work.price_increase;
 var Product_ID Unit_Price Year;
run;
