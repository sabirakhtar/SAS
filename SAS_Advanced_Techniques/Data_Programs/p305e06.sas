data warehouses;   
   set orion.productlist(keep=ProductID ProductName ProductLevel
                         where=(ProductLevel=1));
   ProdID=put(ProductID,12.);
   ProductLine=input(substr(ProdID,1,2),2.);
   ProductCategory=input(substr(ProdID,3,2),2.);
   ProductLocID=input(substr(ProdID,12,1),1.);
   if ProductLine in (21,22) and ProductCategory<=2 
      and ProductLocID<2;
run;
