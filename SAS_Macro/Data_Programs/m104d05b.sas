*m104d05b;

proc sql noprint outobs=3;
   select total_retail_price, order_date format=mmddyy10.
      into :price1-:price3, :date1-:date3
      from orion.order_fact
      where year(order_date)=2011
      order by total_retail_price desc;
quit;

%put &price1 &date1, &price2 &date2, &price3 &date3;
