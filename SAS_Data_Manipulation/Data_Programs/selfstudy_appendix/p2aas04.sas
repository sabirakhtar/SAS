options validvarname=v7;

/*libname excel pcfiles path="&path\Orion.xlsx";*/

/*libname excel excel "&path\Orion.xlsx";*/

options ls=120;
proc transpose data=Excel.'Order Summary$'n 
               (where=(Customer_ID is not missing))
               out=Cust_Orders (drop=_name_ _label_) 
               prefix=Month;
   by Customer_ID;
   id Order_Month;
   var Sale_Amt;
run;


/* libname excel xlsx "&path\Orion.xlsx"; */
 
/* options ls=120; */
/* proc transpose data=Excel.'Order Summary'n  */
/*                (where=(Customer_ID is not missing)) */
/*                out=Cust_Orders (drop=_name_ _label_)  */
/*                prefix=Month; */
/*    by Customer_ID; */
/*    id Order_Month; */
/*    var Sale_Amt; */
/* run; */

proc print data=Cust_Orders;
   var Customer_ID Month1-Month12;
run;

options ls=97;

libname excel clear;


