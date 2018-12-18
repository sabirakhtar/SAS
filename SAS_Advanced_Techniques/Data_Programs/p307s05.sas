proc datasets lib=orion nolist;
   modify shoeprices;
      index create ProductID;
quit;

options nofmterr;

data shoes errors(keep=ProductID ProductName SupplierName);
   set orion.shoevendors(keep=ProductID ProductName SupplierName 
                         MfgSuggestedRetailPrice);
   set orion.shoeprices(keep=ProductID TotalRetailPrice CostPriceperUnit) 
                        key=ProductID;
   if _IORC_=0 then output shoes;
   else do;
      _ERROR_=0;
      output errors;
   end;
run;

proc print data=shoes(obs=5) noobs;
   title 'The Shoes Data Set';
   title2 'First 5 Observations';
run;

proc print data=errors noobs;
   title 'The errors Data Set';
run;

proc datasets lib=orion nolist;
   modify shoeprices;
      index delete ProductID;
quit;

title;
