*m104a02;

data _null_;
   set orion.customer;
   call symputx('name'||left(Customer_ID), customer_Name);
run;

%let custID=9;

proc print data=orion.order_fact;
   where customer_ID=&custID;
   var order_date order_type quantity total_retail_price;
   title1 "Customer Number: &custID";
   title2 "Customer Name: &name9";
run;

title;
