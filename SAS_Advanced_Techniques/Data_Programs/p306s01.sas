data orders;
   length SaleType $40;
   keep OrderID OrderType SaleType;
   if _N_=1 then do;
      declare hash Product();
      Product.definekey('OrderType');
      Product.definedata('SaleType');
      Product.definedone();
      Product.add(key:1, data:'Retail Sale');
      Product.add(key:2, data:'Catalog Sale');
      Product.add(key:3, data:'Internet Sale');
      call missing(SaleType);
   end;
   set orion.orders;
   rc=Product.find();
   if rc=0; 
run;

proc print data=orders(obs=5) noobs;
   title 'orders Data Set';
run;

title;
