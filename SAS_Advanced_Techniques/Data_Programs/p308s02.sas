/* Create the MKT function */
proc fcmp outlib=orion.functions.Marketing;
   function MKT(ID, Type) $ 40;
         if Type=1 then return(catx(' - ',put(ID,12.),'Mail In-Store Coupon'));
    else if Type=2 then return(catx(' - ',put(ID,12.),'Send New Catalog'));
    else if Type=3 then return(catx(' - ',put(ID,12.),'Send Email'));
   endsub;
quit;


/* Use the MKT function */
proc sort data=orion.orderfact out=work.LastOrder;
  by CustomerID OrderDate;
run;

options cmplib=orion.functions;

Data work.LastOrder;
 set work.LastOrder;
 by CustomerID OrderDate;
 if last.CustomerID;
 MarketingComment=MKT(CustomerID, OrderType);
run;

title 'Marketing Comment';
proc print data=work.LastOrder(obs=5) noobs;
 var CustomerID OrderDate OrderType MarketingComment;
run;
