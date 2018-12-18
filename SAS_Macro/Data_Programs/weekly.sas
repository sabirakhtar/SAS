*weekly;

proc means data=orion.order_fact n sum mean;
   where order_date between "&sysdate9"d - 6 and "&sysdate9"d;
   var quantity total_retail_price;
   title "Weekly sales: &sysdate9";
run;
