*m105e07;

title; 
footnote; 

*Parts a-b;
proc means data=orion.order_fact sum mean maxdec=2;
   where Order_Type=1;
   var Total_Retail_Price CostPrice_Per_Unit;  
   title "Summary Report for Order Type 1";
run;

*Parts c-d;
data _null_;
   set orion.lookup_order_type;
run;