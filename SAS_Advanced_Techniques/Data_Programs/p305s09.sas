data combine;
   array msp{21:24,2} _temporary_ ;
   keep ProductID ProductName TotalRetailPrice ManufacturerSuggestedPrice; 
   format ManufacturerSuggestedPrice dollar8.2;
   if _N_= 1 then do i=1 to All;
      set orion.msp nobs=All;
	   msp{ProdLine,input(substr(put(ProdCatID,4.),3,2),2.)}
         =AvgSuggestedRetailPrice;
   end;
   set orion.shoesales;
   ProdID=put(ProductID,12.);
   ProductLine=input(substr(ProdID,1,2),2.);
   ProductCatID=input(substr(ProdID,3,2),2.);
   ManufacturerSuggestedPrice=msp{ProductLine, ProductCatID};
run;

proc print data=combine(obs=5) noobs;
   title1 'combine Data Set';
run;

title;
