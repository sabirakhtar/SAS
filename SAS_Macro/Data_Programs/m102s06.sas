/* m102s06 */    
title; 
footnote; 

/* Part A */
%let type=Gold;
proc print data=orion.customer_dim;
   var Customer_Name Customer_Gender Customer_Age;
   where Customer_Group contains "&type" and 
         Customer_Age between 30 and 45 ;
   title "&type Customers between 30 and 45";
run;

/* Part B */
%let type=Gold;
%let age1=30;
%let age2=45;
proc print data=orion.customer_dim;
   var Customer_Name Customer_Gender Customer_Age;
   where Customer_Group contains "&type" and 
         Customer_Age between &age1 and &age2 ;
   title "&type Customers between &age1 and &age2";
run;

/* Part C */
options symbolgen;
proc print data=orion.customer_dim;
   var Customer_Name Customer_Gender Customer_Age;
   where Customer_Group contains "&type" and 
         Customer_Age between &age1 and &age2 ;
   title "&type Customers between &age1 and &age2";
run;

/* Part D */
%let age1=20;
%let age2=30;
proc print data=orion.customer_dim;
   var Customer_Name Customer_Gender Customer_Age;
   where Customer_Group contains "&type" and 
         Customer_Age between &age1 and &age2 ;
   title "&type Customers between &age1 and &age2";
run;

/* Part E */
options nosymbolgen;
