data customers;
   length CustomerType $40;
   keep CustomerID CustomerTypeID CustomerType;
   if _N_=1 then do;
      declare hash Customer(dataset:'orion.customertype');
      Customer.definekey('CustomerTypeID');
      Customer.definedata('CustomerType');
      Customer.definedone();
      call missing(CustomerType);
   end;
   set orion.Customer;
   if Customer.find()=0;
run;

proc print data=customers(obs=5) noobs;
   title 'Partial customers Data Set';
run;

title;

 /* alternate solution  */
 /*
data customers;
   keep CustomerID CustomerTypeID CustomerType;
   if 0 then set orion.customertype(keep=CustomerTypeID CustomerType);
   if _N_=1 then do;
      declare hash Customer(dataset:'orion.customertype');
      Customer.definekey('CustomerTypeID');
      Customer.definedata('CustomerType');
      Customer.definedone();
   end;
   set orion.customer;
   if Customer.find()=0;
run;

proc print data=customers(obs=5) noobs;
   title 'customers Data Set';
run;

title;
 */
