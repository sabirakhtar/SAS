*m105e01.sas;

%macro listing(custtype);
	proc print data=orion.customer noobs;
	run;
%mend listing;

%listing(2010)