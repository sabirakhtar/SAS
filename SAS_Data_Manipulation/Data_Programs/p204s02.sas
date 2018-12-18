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
 /*               infile "&path..rawdata(sales1)";           */
 /*********************************************************************/

data AU_trainees US_trainees;
   drop Country;
   infile "&path\sales1.dat"; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18.
         @43 Job_Title $20.
         @64 Salary Dollar8.
         @73 Country $2.
         @87 Hire_Date mmddyy10.;
   if Job_Title = 'Sales Rep. I';
   if Country = 'AU' then output AU_trainees;
   else if Country = 'US' then output US_trainees;
run;

title 'Australian Trainees';
proc print data=AU_trainees noobs;
run;

title 'US Trainees';
proc print data=US_trainees noobs;
run;
title;
