 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/phone.csv" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(phone)" dlm=',';         */
 /****************************************************************/

data work.contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile "&path\phone.csv" dlm=',' missover; 
   input Name $ Phone $ Mobile $;
run;

proc print data=work.contacts noobs;
run;

 /* using DSD and MISSOVER options */
data work.contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile "&path\phone.csv" dsd missover; 
   input Name $ Phone $ Mobile $;
run;

proc print data=work.contacts noobs;
run;
