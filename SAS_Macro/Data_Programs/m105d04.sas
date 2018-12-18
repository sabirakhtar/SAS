*m105d04;

%macro counts(rows);
   title 'Customer Counts by Gender';
   proc freq data=orion.customer_dim;
      tables
   %if &rows ne  %then &rows *;
      customer_gender;
   run;
%mend counts;

options mprint nomlogic nosymbolgen;

%counts()
%counts(customer_age_group)
