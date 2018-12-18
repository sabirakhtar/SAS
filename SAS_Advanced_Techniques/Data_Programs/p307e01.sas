proc sort data=orion.orderfact(keep=CustomerID ProductID)  
          out=orderfact;
   by CustomerID;
run;
