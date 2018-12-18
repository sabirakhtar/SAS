 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/sales3inv.dat" dlm=',';              */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(sales3inv)" dlm=',';       */
 /****************************************************************/

data work.sales;
   infile "&path\sales3inv.csv" dlm=',';
   input Employee_ID First $ Last $ 
         Job_Title $ Salary  Country $;
run;

proc print data=work.sales;
run;
