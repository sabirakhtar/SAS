
 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/phone2.csv" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(phone2)" dlm=',';         */
 /****************************************************************/

data work.contacts;
	length Name $ 20 Phone Mobile $ 14;
	infile "&path\phone2.csv" dlm=','; 
	input Name $ Phone $ Mobile $;
run;

proc print data=work.contacts noobs;
run;
