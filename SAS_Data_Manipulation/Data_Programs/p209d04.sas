  /* This program will only execute on the Windows platform */
proc sort data=orion.Customer_Orders out=CustOrdProd;
   by Supplier;
run;

options validvarname=v7;


/*libname bonus pcfiles path="&path\BonusGift.xlsx";*/


/*libname bonus excel "&path\BonusGift.xlsx";*/


/* libname bonus xlsx "&path\BonusGift.xlsx"; */

 

data CustOrdProdGift;
   merge CustOrdProd(in=c) 
         bonus.'Supplier$'n(in=s
            rename=(SuppID=Supplier
                    Quantity=Minimum));
   by Supplier;
   if c=1 and s=1 and Quantity > Minimum;
run;

/* XLSX Engine Data Step */

/*data CustOrdProdGift;                  */
/*   merge CustOrdProd(in=c)             */
/*          bonus.Supplier(in=s          */
/*            rename=(SuppID=Supplier    */
/*                    Quantity=Minimum)); */
/*   by Supplier;                        */
/*   if c=1 and s=1 and Quantity > Minimum; */
/*run; */
 


libname bonus clear;

proc sort data=CustOrdProdGift;
   by Customer_Name;
run;

proc print data=CustOrdProdGift noobs;
   var Customer_Name Gift;
run;

