 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/pricing.dat" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(pricing)" dlm=',';         */
 /****************************************************************/
data work.prices;
   infile "&path\pricing.dat" dlm='*';
   input ProductID StartDate :date. EndDate :date. 
         Cost :dollar. SalesPrice :dollar.;
   format StartDate EndDate mmddyy10.
          Cost SalesPrice 8.2; 
run;

title '2011 Pricing';
proc print data=work.prices;
run;
title;

