 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/sales.csv" dlm=',';                  */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(sales)" dlm=',';           */
 /****************************************************************/

data work.subset;
   infile "&path\sales.csv" dlm=','; 
   input Employee_ID First_Name :$12. Last_Name :$18. 
			Gender :$1. Salary Job_Title :$25. Country :$2.; 
run;

proc print data=work.subset noobs;
run;
