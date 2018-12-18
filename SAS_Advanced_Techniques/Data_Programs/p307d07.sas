/*write errors to separate file, suppress error messages*/
data catalogcustomers(keep=CustomerID OrderID
       Quantity TotalRetailPrice CustomerCountry
       CustomerGender CustomerName CustomerAge)
     errors(keep=CustomerID);
   set orion.catalog (keep=CustomerID OrderID 
        Quantity TotalRetailPrice);
   set orion.customerdimmore key=CustomerID;
   if _IORC_=0 then output catalogcustomers;
   else do;
      _ERROR_=0;
      output errors;
   end;
run;




