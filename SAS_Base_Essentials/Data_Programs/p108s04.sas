 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/custca.csv" dlm=',';                 */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(custca)" dlm=',';          */
 /****************************************************************/

data work.canada_customers;
   length First Last $ 20 Gender $ 1 AgeGroup $ 12;
   infile "&path\custca.csv" dlm=',';
   input First $ Last $ ID Gender $ 
         BirthDate :ddmmyy. Age AgeGroup $;
   format BirthDate monyy7.;
   drop ID Age;
run;

title 'Canadian Customers';
proc print data=work.canada_customers;
run;
title;

  /* Alternate solution using informats */
data work.canada_customers;
   infile "&path\custca.csv" dlm=',';
   input First :$20. Last :$20. ID Gender :$1. 
         BirthDate :ddmmyy. Age AgeGroup :$12.;
   format BirthDate monyy7.;
   drop ID Age;
run;

title 'Canadian Customers';
proc print data=work.canada_customers;
run;
title;
