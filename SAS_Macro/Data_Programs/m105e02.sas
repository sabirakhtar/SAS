*m105e02;

%macro day;
	%if &sysday=SATURDAY  
		%then %put Yes;
		%else %put Sorry;
%mend day;

options nomlogic nosymbolgen;

%day
