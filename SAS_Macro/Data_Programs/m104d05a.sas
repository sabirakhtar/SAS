*m104d05a;

proc sql noprint;
   select sum(total_retail_price) format=dollar8. into :total
      from orion.order_fact
      where year(order_date)=2011 and order_type=3;
quit;

%put &=total;
