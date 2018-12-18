 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/newemps.csv" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(newemps)" dlm=',';         */
 /****************************************************************/

data work.newemployees;
   length First $ 12 Last $ 18 Title $ 25;
   infile "&path\newemps.csv" dlm=',';
   input First $ Last $ Title $ Salary;
run;

proc print data=work.newemployees;
run;
