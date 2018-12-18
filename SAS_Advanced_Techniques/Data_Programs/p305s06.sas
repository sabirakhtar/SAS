data warehouses;
   array W{21:22,0:2,0:1} $ 5  _temporary_ ('A2100','A2101','A2110','A2111','A2120',
                                             'A2121','B2200','B2201','B2210','B2211',
                                             'B2220','B2221');
   set orion.productlist(keep=ProductID ProductName ProductLevel
                         where=(ProductLevel=1));
   ProdID=put(ProductID,12.);
   ProductLine=input(substr(ProdID,1,2),2.);
   ProductCategory=input(substr(ProdID,3,2),2.);
   ProductLocID=input(substr(ProdID,12,1),1.);
   if ProductLine in (21,22) and ProductCategory<=2 
      and ProductLocID<2;
   Warehouse=W{ProductLine, ProductCategory, ProductLocID};
run;

proc print data=warehouses(obs=5);
   title 'Warehouses Data';
run;
