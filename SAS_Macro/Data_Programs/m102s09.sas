/* m102s09 */   
 title; 
footnote; 

/* Part A */
%let dsn=Organization;
%let var=Employee;
proc print data=orion.&dsn._dim;
   id &var._ID;
   var &var._Name &var._Country &var._Gender;
   title "Listing of All &var.s From Orion.&dsn._Dim";
run;

/* Part B */
%let dsn=Customer;
%let var=Customer;
proc print data=orion.&dsn._dim;
   id &var._ID;
   var &var._Name &var._Country &var._Gender;
   title "Listing of All &var.s From Orion.&dsn._Dim";
run;
