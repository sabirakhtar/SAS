*m104d03d;

data _null_;
   set orion.customer;
   call symputx('name'||left(Customer_ID), customer_Name);
run;

%put _user_;
