 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/prices.dat" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(prices)" dlm=',';         */
 /****************************************************************/
data work.prices;
   infile "&path\prices.dat" dlm='*' missover;
   input ProductID StartDate :date. EndDate :date. 
         UnitCostPrice :dollar. UnitSalesPrice :dollar.;
   label ProductID='Product ID'
         StartDate='Start of Date Range'
         EndDate='End of Date Range'
         UnitCostPrice='Cost Price per Unit'
         UnitSalesPrice='Sales Price per Unit';
   format StartDate EndDate mmddyy10.
          UnitCostPrice UnitSalesPrice 8.2; 
run;

title '2007 Prices';
proc print data=work.prices label;
run;
title;
