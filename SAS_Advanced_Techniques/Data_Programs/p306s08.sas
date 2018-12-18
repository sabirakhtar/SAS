data different; 
   drop rc; 
   if _N_=1 then do;
      if 0 then set orion.orderfact(keep=CustomerID
                                         OrderType);
      declare hash Orders(dataset: 'orion.orderfact', 
                          ordered: 'yes');
      declare hiter OF('Orders');
      orders.definekey('CustomerID', 'OrderType');
      orders.definedata('CustomerID', 'OrderType');
      orders.definedone();
   end;
   rc=OF.first();
   do while (rc=0);
      output;
      rc=OF.next();
   end;
   stop;
run;

proc print data=different(obs=5) noobs;
   title "No Duplicates";
run;

title;
