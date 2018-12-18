 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/donation.csv" dlm=',';               */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(donation)" dlm=',';        */
 /****************************************************************/

data work.donations;
	infile "&path\donation.csv" dsd missover;
	input EmpID Q1 Q2 Q3 Q4;
run;

proc print data=work.donations;
run;
