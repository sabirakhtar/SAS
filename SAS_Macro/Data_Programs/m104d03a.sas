*m104d03a;

proc print data=orion.order_fact;
   where customer_ID=9;
   var order_date order_type quantity total_retail_price;
   title1 "Customer Number: 9";
   title2 "Customer Name: Cornelia Krahl";
run;

title;
