/*data set one has contiguous duplicates of the CustomerID value. */
/*Each has a match in data set two.*/ 
data one;
customerid='A'; x=1;output;
customerid='A'; x=2;output;
customerid='A'; x=3;output;
run;

data two(index=(customerid));
customerid='A'; y=1;output;
customerid='A'; y=2;output;
customerid='A'; y=3;output;
run;

data three;
 set one;
 set two key=customerid;
run;

proc print data=three;
run;

/*Data set one has contiguous duplicates. Some do not have a */
/*separately occurring match in data set two.*/
data one;
customerid='A'; x=1;output;
customerid='A'; x=2;output;
customerid='A'; x=3;output;
run;

data two(index=(customerid));
customerid='A'; y=1;output;
customerid='A'; y=2;output;
run;

data three;
 set one;
 set two key=customerid;
run;

proc print data=three;
run;

/*The UNIQUE option forces SAS to ignore duplicates.*/
data one;
customerid='A'; x=1;output;
customerid='A'; x=2;output;
customerid='A'; x=3;output;
run;

data two(index=(customerid));
customerid='A'; y=1;output;
customerid='A'; y=2;output;
customerid='B'; y=3;output;
run;
data three;
   set one;
   set two key=CustomerID/unique;
run;

proc print data=three;
run;

/*The non-contiguous duplicates in data set one match only*/
/*the first occurrence in data set two.*/
data one;
customerid='A'; x=1;output;
customerid='B'; x=2;output;
customerid='A'; x=3;output;
run;

data two(index=(customerid));
customerid='A'; y=1;output;
customerid='A'; y=2;output;
customerid='B'; y=3;output;
run;
data three;
   set one;
   set two key=CustomerID;
run;

proc print data=three;
run;
