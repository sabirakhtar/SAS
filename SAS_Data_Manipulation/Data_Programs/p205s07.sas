/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/supply.dat";                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(supply)";           */
 /*********************************************************************/

data work.supplier;
   length Supplier_ID $ 5 Supplier_Name $ 30 Country $ 2;
   infile "&path\supply.dat"; 
   input Supplier_ID $;
   Country=scan(_INFILE_,-1,' ');
   StartCol=find(_INFILE_,' ');   
   EndCol=length(_INFILE_)-3;
   /* Everything between these first and last blanks is
   the supplier name. */
   Supplier_Name=substr(_INFILE_,StartCol+1,EndCol-StartCol);
   /* Knowing where the last blank is, Country could have 
   also been created using SUBSTR. */
   drop StartCol EndCol;
run;

title 'Supplier Information';
proc print data=work.supplier noobs;
run;
title;
