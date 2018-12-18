/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/sales2.dat";                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(sales2)";           */
 /*********************************************************************/

data sales_staff2;
   infile "&path\sales2.dat"; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18. /
          @1 Job_Title $20.
         @22 Hire_Date mmddyy10.
         @33 Salary dollar8. /;
run;

  /* Alternate */
data sales_staff2;
   infile "&path\sales2.dat"; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18.;
   input  @1 Job_Title $20.
         @22 Hire_Date mmddyy10.
         @33 Salary dollar8.;
   input;
run;

  /* Alternate */
data sales_staff2;
   infile "&path\sales2.dat"; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18. 
    #2    @1 Job_Title $20.
         @22 Hire_Date mmddyy10.
         @33 Salary dollar8.
    #3    ;
run;

title 'Australian and US Sales Staff';
proc print data=sales_staff2 noobs;
run;
title;
