/*********************************************************************/
/* This program uses an INFILE statement to read a raw data file.    */
/* The INFILE statement includes a full path for Microsoft Windows.  */
/*                                                                   */
/* For UNIX                                                          */
/*      Replace  the INFILE statement with the following statement:  */
/*               infile "&path/emps.dat" firstobs=11 obs=15;         */
/*                                                                   */
/* For  z/OS:                                                        */
/*      Replace  the INFILE statement with the following statement:  */
/*               infile "&path..rawdata(emps)" firstobs=11 obs=15;   */
/*********************************************************************/
  
/* Use FIRSTOBS= and OBS= in an INFILE statement */

data employees;
  infile "&path\emps.dat" firstobs=11 obs=15;
  input @1 EmpID 8. @9 EmpName $40. @153 Country $2.;
run;
proc print data=employees;
run;
