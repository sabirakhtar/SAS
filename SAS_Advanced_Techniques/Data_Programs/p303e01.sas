proc freq data=orion.customerdim;
tables customertype;
run;

proc freq data=orion.orderfact;
tables ordertype;
run;

proc freq data=orion.productdim;
tables productcategory;
run;

proc freq data=orion.employeepayroll;
tables employeegender;
run;

proc means data=orion.employeepayroll;
class employeegender;
var salary;
run;

proc means data=orion.orderfact;
class ordertype;
var totalretailprice;
run;

proc means data=orion.employeepayroll;
class dependents;
var salary; 
run;

proc sort data=orion.employeepayroll;
by descending salary;
run;
