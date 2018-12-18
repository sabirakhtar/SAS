data prices(bufsize=2K bufno=4);
   infile "&path/prices.dat" dlm='*';
   input ProductID:12. StartDate:date9. 
         EndDate:date9. 
         UnitCostPrice:dollar7.2 
         UnitSalesPrice:dollar7.2;
run;
