proc contents data=orion.charities;
run;

proc contents data=orion.us_suppliers;
run;

proc contents data=orion.consultants;
run;

data work.contacts;	
	set orion.charities orion.us_suppliers;
run;

proc contents data=work.contacts;
run;

data work.contacts2;	
	set orion.us_suppliers orion.charities;
run;

proc contents data=work.contacts2;
run;


data work.contacts3;	
	set  orion.us_suppliers orion.consultants;
run;
