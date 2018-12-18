/*Part A*/
/*Create a SAS Data Set*/

filename MON ("&path/mon3.dat" "&path/mon2.dat" "&path/mon1.dat"); * Windows and UNIX;
*filename MON ("&path..rawdata(mon3)" "&path..rawdata(mon2)" "&path..rawdata(mon1)"); * z/OS ;

data orion.quarter;
   infile MON dlm=',';
   input CustomerID OrderID OrderType 
         OrderDate : date9. DeliveryDate : date9.;
  time=time();
  format time timeAMPM.;
run;

proc print data=orion.quarter;
   title 'orion.quarter';
   format OrderDate DeliveryDate date9.;
run;

/*Part B*/
/*Create a SAS Data View*/
data orion.quarterv/view=orion.quarterv;
   infile MON dlm=',';
   input CustomerID OrderID OrderType 
         OrderDate : date9. DeliveryDate : date9.;
  time=time();
  format time timeAMPM.;
run;

proc print data=orion.quarterv;
   title 'work.quarter view';
   format OrderDate DeliveryDate date9.;
run;

/*Part C*/
proc contents data=orion.quarterv;
run;

/*if needed*/
data view=orion.quarterv;
   describe;
run;
