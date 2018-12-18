/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/sales1.dat";                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(sales)";           */
 /*********************************************************************/
data sales_staff;
   infile "&path\sales1.dat"; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18.
         @43 Job_Title $20.
         @64 Salary Dollar8.
         @87 Hire_Date mmddyy10.;
run;

title 'Australian and US Sales Staff';
proc print data=sales_staff noobs;
run;
title;
