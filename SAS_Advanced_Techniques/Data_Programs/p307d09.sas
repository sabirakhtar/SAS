proc sql;
   create index CustomerID
      on orion.customerdim(CustomerID);
quit;

data cataloginternet catalognoncust catalogcust; 
   keep CustomerID OrderID Quantity TotalRetailPrice CustomerName IntOrderID IntTotPrice IntQuant
       IORC_DIM IORC_INT;  
   set orion.catalog(keep=CustomerID OrderID Quantity TotalRetailPrice in=InCat);
   set orion.customerdim key=CustomerID;
     IORC_DIM=_IORC_;
   set orion.internet(rename=(OrderID=IntOrderID TotalRetailPrice=IntTotPrice Quantity=IntQuant))
		   key=CustomerID;
     IORC_INT=_IORC_;
   if IORC_DIM=0 and IORC_INT=0 then output cataloginternet;
   else if IORC_DIM ne 0 and IORC_INT ne 0 then do;
      _ERROR_=0;
      output catalognoncust;
   end;
   else do;
	  _ERROR_=0;
	  output catalogcust;
   end;
run;

proc print data=cataloginternet(obs=5) noobs label;
   title 'Customers Who Ordered from Both Catalog and Internet';
run;
proc print data=catalognoncust(obs=5) noobs label;
   title 'Catalog Only Orders with no link to Customer Database';
run;
proc print data=catalogcust(obs=5) noobs label;
   title 'Catalog Only Orders from existing Customers';
run;

proc sql;
   drop index CustomerID
      from orion.customerdim;
quit;


