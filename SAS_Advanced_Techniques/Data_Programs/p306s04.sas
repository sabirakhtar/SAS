data billing;
   drop rc1 rc2;
   if _N_=1 then do;
      if 0 then set orion.productlist(keep=ProductID ProductName);
      if 0 then set orion.customerdim(keep=CustomerID CustomerCountry CustomerName);
      declare hash Prod(dataset:'orion.productlist');
      Prod.definekey('ProductID');
      Prod.definedata('ProductName');
      Prod.definedone();
      declare hash Customer(dataset:'orion.customerdim');
      customer.definekey('CustomerID');
      customer.definedata('CustomerCountry', 'CustomerName');
      customer.definedone();
   end;
   set orion.orderfact(keep=OrderDate Quantity ProductID
   TotalRetailPrice CustomerID);
   rc1=Customer.find();
   if rc1=0;
   rc2=Prod.find();
   if rc2=0;
run;

proc sort data=billing;
   by CustomerID ProductID;
run;

proc print data=billing(obs=5) noobs;
   var CustomerID CustomerName ProductID ProductName 
       OrderDate Quantity TotalRetailPrice;
   title1 'Billing Information';
   title2 'Using a HASH Data Step Object';
run;   

title;
