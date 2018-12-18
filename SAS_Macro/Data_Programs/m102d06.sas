*m102d06;

%let thisyr=%substr(&sysdate9,6);
%let lastyr=%eval(&thisyr-1);

proc means data=orion.order_fact maxdec=2 min max mean;
   class order_type;
   var total_retail_price;
   where year(order_date) between &lastyr and &thisyr;
   title1 "Orders for &lastyr and &thisyr";
   title2 "(as of &sysdate9)";
run;

title;
