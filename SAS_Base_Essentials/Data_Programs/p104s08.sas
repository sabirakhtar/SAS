proc sort data=orion.orders out=work.custorders nodupkey 
          dupout=work.duplicates;
     by customer_id;
run;

title 'Unique Customers';
proc print data=work.custorders;
run;

title 'Duplicate Customer Observations';
proc print data=work.duplicates;
run;

title;
