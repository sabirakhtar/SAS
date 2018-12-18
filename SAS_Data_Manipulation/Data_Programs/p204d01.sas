/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/offers.dat";                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(offers)";           */
 /*********************************************************************/

data work.discounts;
  infile "&path\offers.dat";
  input @1 Cust_type 4. 
        @5 Offer_dt mmddyy8.
        @14 Item_gp $8. 
        @22 Discount percent3.;
run;

proc print data=work.discounts noobs;
run;

proc print data=work.discounts noobs;
  format Offer_dt date9.;
run;
