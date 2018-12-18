data warehouses;
   keep ProductID ProductName Warehouse;
   array w{21:24,0:8,0:9} $ 5  _temporary_ ;
   if _n_=1 then do i=1 to all;
      set orion.warehouses nobs=all;
      W{ProductLine, ProductCatID, ProductLocID}=Warehouse;
   end;
   set orion.productlist(keep=ProductID ProductName
                              ProductLevel 
                              where=(ProductLevel=1)); 
   ProdID=put(ProductID,12.);
   ProductLine=input(substr(ProdID,1,2),2.);
   ProductCatID=input(substr(ProdID,3,2),2.);
   ProductLocID=input(substr(ProdID,12,1),1.);
   Warehouse=w{ProductLine, ProductCatID, ProductLocID};
run;

proc print data=warehouses(obs=5) noobs;
   title 'warehouses';
run;

title;
