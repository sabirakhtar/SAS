data refunds;
   set orion.orderfact(keep=EmployeeID Quantity
                            TotalRetailPrice);
   if Quantity > 2 then RefundAmt=Quantity * TotalRetailPrice * 0.10;
   else RefundAmt=Quantity * TotalRetailPrice * 0.05;
run;

proc print data=refunds (obs=5) noobs;
  title 'Partial refunds Data Set';
run;

title;

