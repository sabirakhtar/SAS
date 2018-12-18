*m104d04;

data _null_;
   set orion.customer;
   call symputx('name'||left(Customer_ID), customer_Name);
run;

%put _user_;

%let custID=9;
proc print data=orion.order_fact;
   where customer_ID=&custID;
   var order_date order_type quantity total_retail_price;
   title1 "Customer Number: &custID";
   title2 "Customer Name: &&name&custID";
run;

title;
