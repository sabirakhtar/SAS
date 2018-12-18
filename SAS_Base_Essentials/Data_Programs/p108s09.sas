 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/managers.dat" dlm=',';               */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(managers)" dlm=',';         */
 /****************************************************************/

data work.salesmgmt;
	length First Last $ 12 Gender $ 1 Title $ 25 Country $ 2;
	format BirthDate HireDate date9.;
	infile "&path\managers.dat" dsd dlm='/' missover;
	input ID First Last Gender Salary Title Country 
         BirthDate :date. HireDate :mmddyy.;
run;

title 'Orion Star Managers';
proc print data=work.salesmgmt;
	var ID Last Title HireDate Salary ;
run;
title;

  /* Alternate solution using informats */
data work.salesmgmt;
	format BirthDate HireDate date9.;
	infile "&path\managers.dat" dsd dlm='/' missover;
	input ID First :$12. Last :$12. Gender :$1. Salary Title :$25.
         Country :$2. BirthDate :date. HireDate :mmddyy.;
run;

title 'Orion Star Managers';
proc print data=work.salesmgmt;
	var ID Last Title HireDate Salary ;
run;
title;

