%macro customerlist;
   proc print data=orion.customer_dim;
      var customer_name customer_gender customer_age;
      title "Customers Listing as of &systime";      
   run;
%mend customerlist;
