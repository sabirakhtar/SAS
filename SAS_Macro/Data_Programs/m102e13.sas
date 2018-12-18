*m102e13;

%let d=&sysdate9; 
%let t=&systime;

proc print data=orion.product_dim;
   where Product_Name contains "Jacket";
   var Product_Name Product_ID Supplier_Name;
   title1 "Product Names Containing 'Jacket'";
   title2 "Report produced &t &d";
run;
