*m102d04;

%let date1=25may2011;
%let date2=15jun2011;

proc print data=orion.Order_Fact;
   where Order_Date between "&date1"d and "&date2"d;
   var Order_Date Product_ID Quantity;
   title "Orders between &date1 and &date2";
run;

title;
