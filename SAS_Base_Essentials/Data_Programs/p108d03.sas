 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/sales.csv" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(sales)" dlm=',';         */
 /****************************************************************/

data work.subset;
   length Employee_ID 8 First_Name $ 12 
          Last_Name $ 18 Gender $ 1 
          Salary 8 Job_Title $ 25 
          Country $ 2;
   infile "&path\sales.csv" dlm=','; 
   input Employee_ID First_Name Last_Name  
			Gender Salary Job_Title Country; 
run;

proc contents data=work.subset varnum;
run;

proc print data=work.subset noobs;
run;
