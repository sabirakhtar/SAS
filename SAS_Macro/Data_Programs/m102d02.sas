*m102d02;

%let units=4;
proc print data=orion.Order_Fact;
   where Quantity > &units;
   var Order_Date Product_ID Quantity;
   title "Orders exceeding &units units";
run;

title;
