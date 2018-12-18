/* m103e01 */

title; 
footnote; 

proc print data=orion.customer_dim;
   var Customer_Group Customer_Name Customer_Gender Customer_Age;
   where Customer_Group contains "&type";
   title "&type Customers";
run;
