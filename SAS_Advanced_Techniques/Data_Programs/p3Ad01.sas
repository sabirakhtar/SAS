filename MON ("&path\mon3.dat" "&path\mon2.dat" "&path\mon1.dat"); * PC and Unix;

data quarter;
   infile MON dlm=',';
   input Customer_ID Order_ID Order_Type 
         Order_Date : date9. Delivery_Date : date9.;
run;

proc print data=quarter;
   title 'quarter';
   format Order_Date Delivery_Date date9.;
run;

title;

/*  WINDOWS and UNIX ONLY! */
/*  Read all files whose names start with "mon" */
/*
filename MON ("&path\mon*.dat");
data quarter;
   infile MON dlm=',';
   input Customer_ID Order_ID Order_Type 
         Order_Date : date9. Delivery_Date : date9.;
run;
*/
