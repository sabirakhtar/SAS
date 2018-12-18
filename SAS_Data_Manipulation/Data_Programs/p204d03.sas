/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/address.dat" ;                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(address)" dlm=',';           */
 /*********************************************************************/

data contacts;
   infile "&path\address.dat"; 
   input FullName $30. / /
         Address2 $25. /
         Phone $8. ;    
run;

proc print data=contacts noobs;
run;
