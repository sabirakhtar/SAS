 /*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/newemps.csv" dlm=',';                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(newemps)" dlm=',';           */
 /*********************************************************************/

data work.newsalesemps;
	length First_Name $ 12 Last_Name $ 18
          Job_Title $ 25;
	infile "&path\newemps.csv" dlm=','; 
   input First_Name $ Last_Name $
         Job_Title $ Salary;
run;

proc print data=work.newsalesemps;
run;

proc means data=work.newsalesemps;
	var Salary;
run;
