*m102s13;

%let d=&sysdate9; 
%let t=&systime;
%let product=%nrstr(R&D);

proc print data=orion.product_dim;
   where Product_Name contains "&product";
   var Product_Name Product_ID Supplier_Name;
   title1 "Product Names Containing '&product'";
   title2 "Report produced &t &d";
run;
