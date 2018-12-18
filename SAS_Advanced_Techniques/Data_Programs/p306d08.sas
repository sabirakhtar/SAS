data top bottom;
   drop i;
   if _N_=1 then do;
      if 0 then set orion.orderfact(keep=CustomerID ProductID 
                                         TotalRetailPrice);
      declare hash customer(dataset:'orion.orderfact',
                            ordered:'descending');
      customer.definekey('TotalRetailPrice', 'CustomerID');
      customer.definedata('TotalRetailPrice', 'CustomerID',
                          'ProductID');
      customer.definedone();
      declare hiter C('customer');
   end;
   C.first();
   do i=1 to 2;
      output top;
      C.next();
   end;
   C.last();
   do i=1 to 2;
      output bottom;
      C.prev();
   end;
   stop;
run;

proc print data=top;
  title 'Top 2 Big Spenders';
run;

proc print data=bottom;
  title 'Bottom 2 Frugal Spenders';
run;

title;
