/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/salesemp.dat";                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(salesemp)";           */
 /*********************************************************************/

data work.sales;
   infile "&path\salesemp.dat";
   input EmpID 1-7 First_Name $ 8-17 
         Last_Name $ 19-32 Job_Title $ 34-52 
         Salary 54-59 Country $ 61-62;
run;

proc print data=work.sales noobs;
run;
