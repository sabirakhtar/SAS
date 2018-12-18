/* m103s01 */

title; 
footnote; 

/* Part B */
options mcompilenote=all;
%macro customers;
   proc print data=orion.customer_dim;
      var Customer_Name Customer_Gender Customer_Age;
      where Customer_Group contains "&type";
      title "&type Customers";
   run;
%mend customers;

/* Part C */
%let type=Gold;
%customers

/* Part D */
%let type=Internet;

/* Part E */
options mprint;
%customers