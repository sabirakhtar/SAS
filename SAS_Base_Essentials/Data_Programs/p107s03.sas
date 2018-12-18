/* Create the Excel workbook: employees.xls */
/* Create one worksheet: salesemps */

/* Delete employees.xls from the data directory if it exists */

options validvarname=v7;
*libname out excel "&path\employees.xls";
*libname out pcfiles path="&path\employees.xls";

 data out.salesemps;
    length First_Name $ 12 Last_Name $ 18
           Job_Title $ 25;
    infile "&path\newemps.csv" dlm=','; 
    input First_Name $ Last_Name $
          Job_Title $ Salary;
run;

libname out clear;
