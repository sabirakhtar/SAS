data productsample;
   do i=10 to TotObs by 10;
      set orion.productdim(keep=ProductLine ProductID
                                ProductName SupplierName)
          nobs=TotObs 
          point=i;
      output;
   end;
   stop;
run;

proc print data=productsample(obs=5) noobs;
  title "Systematic Sample of Products";
run;
title;
