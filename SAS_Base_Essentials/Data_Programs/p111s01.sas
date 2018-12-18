title1 'Unique Customers and Salespersons for Retail Sales';
proc freq data=orion.orders nlevels;
   where Order_Type=1;
   tables Customer_ID Employee_ID / noprint;
run;
title;

title1 'Catalog and Internet Customers';
proc freq data=orion.orders order=freq;
   where Order_Type ne 1;
   tables Customer_ID / nocum;
run;
title;
