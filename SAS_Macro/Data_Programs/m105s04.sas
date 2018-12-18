*m105s04;

*Parts b-c;
%macro custtype(type)/minoperator;
   %let type=%upcase(&type);
   %if &type in GOLD INTERNET %then %do;
      proc print data=orion.customer_dim;
         var Customer_Group Customer_Name Customer_Gender Customer_Age;
         where upcase(Customer_Group) contains "&type";
         title "&type Customers";
      run;
   %end;
   %else %do;
      %put ERROR: Invalid TYPE: &type..; 
      %put ERROR: Valid TYPE values are INTERNET or GOLD.;
   %end;
%mend custtype;

%custtype(internet)
%custtype(silver)

*Parts d-e;
%macro custtype(type)/minoperator;
   %if &type= %then %do;
      %put ERROR: Missing TYPE.; 
      %put ERROR: Valid TYPE values are INTERNET or GOLD.;
   %end;
   %else %do;
      %let type=%upcase(&type);
      %if &type in GOLD INTERNET %then %do;
         proc print data=orion.customer_dim;
            var Customer_Group Customer_Name Customer_Gender Customer_Age;
            where upcase(Customer_Group) contains "&type";
            title "&type Customers";
         run;
      %end;
      %else %do;
         %put ERROR: Invalid TYPE: &type..; 
         %put ERROR: Valid TYPE values are INTERNET or GOLD.;
      %end;
   %end;
%mend custtype;

%custtype()
%custtype(internet)
%custtype(silver)
