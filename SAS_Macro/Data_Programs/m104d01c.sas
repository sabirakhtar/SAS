*m104d01c;

%let month=1;
%let year=2011;

data orders;
   keep order_date order_type quantity total_retail_price;
   set orion.order_fact end=final;
   where year(order_date)=&year and month(order_date)=&month;
   if order_type=3 then Number+1;
   if final then call symputx('num', Number);
run;

options nocenter ps=20;

proc print data=orders;
   title "Orders for &month-&year";
   footnote "&num Internet Orders";
run;

title;
footnote;

