 /* Using PROC SUMMARY and the DATA STEP */
proc summary data=orion.orderfact;
   var CostPricePerUnit;
   weight Quantity;
   output out=totals sum=TotalCost;
run;

proc sort data=orion.orderfact out=orderfact;
   by ProductID;
run;

data products(keep=CustomerID CostPricePerUnit Quantity Percent ProductName);
   if _N_=1 then set totals(keep=TotalCost);
   merge orderfact(keep=CustomerID ProductID CostPricePerUnit Quantity in=O)
         orion.productdim(keep=ProductID ProductName in=P);
   by ProductID;
   if O and P;
   Percent=(CostPricePerUnit*Quantity)/TotalCost;
   format Percent percent9.3;
run;

 /* Using PROC SUMMARY and PROC SQL*/
proc summary data=orion.orderfact;
   var CostPricePerUnit;
   weight Quantity;
   output out=totals sum=TotalCost;
run;

proc sql;
   create table products as
   select CustomerID, 
          CostPricePerUnit, 
          Quantity, 
          ProductName, 
          (Quantity*CostPricePerUnit)/TotalCost as Percent format=percent9.3 
   from totals, 
        orion.orderfact, 
        orion.productdim
   where orderfact.ProductID=productdim.ProductID;
quit;

 /* Using PROC SQL only */
proc sql;
   create table products as
   select CustomerID, 
          CostPricePerUnit, 
          Quantity, 
          ProductName, 
          (Quantity*CostPricePerUnit)/sum(Quantity*CostPricePerUnit)
           as Percent format=percent9.3 
   from  orion.orderfact, 
         orion.productdim
   where orderfact.ProductID=productdim.ProductID;
quit;

 /* Using the DATA step only */
proc sort data=orion.orderfact out=orderfact;
   by ProductID;
run;

data products(keep=CustomerID CostPricePerUnit Quantity Percent ProductName);
   if _N_=1 then do i=1 to TotObs;
      set orion.orderfact nobs=TotObs;
      TotalCost+(Quantity*CostPricePerUnit);
   end;
   merge orderfact(keep=CustomerID ProductID CostPricePerUnit Quantity in=O)
         orion.productdim(keep=ProductID ProductName in=P);
   by ProductID;
   if O and P;
   Percent=(CostPricePerUnit*Quantity)/TotalCost;
   format Percent percent9.3;
run;

 /* Part b */
proc print data=products(obs=5) noobs;
   var CustomerID Quantity CostPricePerUnit ProductName Percent;
   title 'The products Data Set';
run;

title;


