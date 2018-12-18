*m104s04;

title; 
footnote; 

*Parts B & C;

data _null_;
     set orion.customer_type;
     call symputx('type'||left(Customer_Type_ID), Customer_Type);
     /* Alternative solution using CATS function                      */
     /* call symputx(cats('type',Customer_Type_ID) , Customer_Type);  */
run;

%put _user_;

%macro memberlist(id=1020);
   title "A List of &&type&id";
   proc print data=orion.customer;
       var Customer_Name Customer_ID Gender;
       where Customer_Type_ID=&id;
   run;
%mend memberlist;

%memberlist()

*Part D;

%memberlist(id=2030)