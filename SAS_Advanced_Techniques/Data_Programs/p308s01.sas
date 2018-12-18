proc fcmp outlib=work.functions.Marketing;
   function REFUND(Quantity, Price);
      if Quantity > 2 then return(Quantity * Price * 0.10);
      else return(Quantity * Price * 0.05);
   endsub;
quit;

options cmplib=work.functions;

data refunds;
   set orion.orderfact(keep=EmployeeID Quantity
                            TotalRetailPrice);
   RefundAmt=REFUND(Quantity, TotalRetailPrice);
run;

proc print data=refunds (obs=5) noobs;
  title 'Partial refunds Data Set';
run;

title;
