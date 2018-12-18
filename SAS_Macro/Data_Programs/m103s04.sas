*m103s04;

title; 
footnote; 

/* Part B*/
options mcompilenote=all;
%macro customers(type);
   proc print data=orion.customer_dim;
      var Customer_Name Customer_Gender Customer_Age;
      where Customer_Group contains "&type";
      title "&type Customers";
   run;
%mend customers;

/* Part C */
options mprint;
%customers(Gold)

/* Part D */
%customers(Catalog)

/* Part E */
%macro customers(type=Club);
   proc print data=orion.customer_dim;
      var Customer_Name Customer_Gender Customer_Age;
      where Customer_Group contains "&type";
      title "&type Customers";
   run;
%mend customers;

/* Part F */
%customers(type=Internet)

/* Part G */
%customers()