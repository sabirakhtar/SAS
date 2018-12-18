 /****************************************************************/
 /* The INFILE statement uses a Microsoft Windows path.          */
 /*                                                              */
 /* For UNIX, Linux, SAS University Edition, and SAS on Demand:  */
 /*      Change the INFILE statement to:                         */
 /*           infile "&path/country.dat" dlm=',';                */
 /*                                                              */
 /* For  z/OS:                                                   */
 /*      Change the INFILE statement to:                         */
 /*            infile "&path..rawdata(country)" dlm=',';         */
 /****************************************************************/

data work.country2;
   length Country_Code $ 2 Country_Name $ 48;
   infile "&path\country.dat" dlm='!'; 
   input Country_Code $ Country_Name $;
run;

proc print data=work.country2;
	var Country_Code Country_Name
run;
