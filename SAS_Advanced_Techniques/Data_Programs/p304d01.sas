data subset;
   do PickIt=1 to TotObs by 50; 
      set orion.orderfact(keep=CustomerID
             EmployeeID StreetID OrderID)
          point=PickIt
          nobs=TotObs; 
      output; 
   end;
   stop; 
run;
