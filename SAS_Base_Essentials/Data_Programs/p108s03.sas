 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/managers2.dat" dlm='09'x;            */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(managers2)" dlm='05'x;     */
 /****************************************************************/

data work.managers2;
	length First Last $ 12 Title $ 25;
	infile "&path\managers2.dat" dlm='09'x;
	input ID First $ Last $ Gender $ Salary Title $;
	keep First Last Title;
run;

proc print data=work.managers2;
run;
