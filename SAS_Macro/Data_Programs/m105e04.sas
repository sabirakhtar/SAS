*m105e04;

%macro custtype(type);
   %let type=%upcase(&type);
    proc print data=orion.customer_dim;
       var Customer_Group Customer_Name Customer_Gender  
           Customer_Age;
       where upcase(Customer_Group) contains "&type";
       title "&type Customers";
    run;
%mend custtype;

%custtype(internet)
