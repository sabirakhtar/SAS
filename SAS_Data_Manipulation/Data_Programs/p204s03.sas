/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/seminar.dat";                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(seminar)";           */
 /*********************************************************************/

data seminar_ratings;
   infile "&path\seminar.dat"; 
   input Name $15.  @'Rating:' Rating 1.;
run;

title 'Names and Ratings';
proc print data=seminar_ratings;
run;
title;
