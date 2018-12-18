proc contents data=orion.catalog;
   title 'orion.catalog Contents';
run;

proc contents data=orion.internet;
   title 'orion.internet Contents';
run;

proc contents data=orion.retail;
   title 'orion.retail Contents';
run;

data allcustomers;
   length Quantity 3 
          CustomerID OrderDate DeliveryDate 4 
          EmployeeID 5 
          StreetID OrderID 6
   	    ProductID 7;
   set orion.catalog orion.internet orion.retail;
run;

proc contents data=allcustomers;
   title 'allcustomers Contents';
run;

title;
