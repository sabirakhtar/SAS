data euros;
   set orion.orderfact(where=
       (OrderDate between '01SEP2011'd and '30SEP2011'd)
   keep=CustomerID OrderDate ProductID TotalRetailPrice);
   do while (not (SDate <= OrderDate <= EDate));
      set orion.rates;
   end;
   EuroPrice=TotalRetailPrice*AvgRate;
   format EuroPrice Euro10.2;
run;

proc print data=euros(obs=5) noobs;
  title 'work.euros Data Set';
run;

title;
