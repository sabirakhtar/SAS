*m105s06;

title; 
footnote; 

%macro salarystats(decimals=2,order=internal)/minoperator;
   %let numerrors=0;
   %if not (&decimals in 0 1 2 3 4) %then %do;
      %let numerrors=%eval(&numerrors+1);
      %put ERROR: Invalid DECIMALS parameter: &decimals..;
      %put ERROR- Valid DECIMALS values are 0 to 4.; 
   %end;
	%let order=%upcase(&order);
   %if not (&order in INTERNAL FREQ) %then %do;
      %let numerrors=%eval(&numerrors+1);
      %put ERROR: Invalid ORDER parameter: &order..;
      %put ERROR- Valid ORDER values are INTERNAL or FREQ.; 
   %end;
   %if &numerrors=0 %then %do;
		options nolabel;
		title 'Salary Stats';
      proc means data=orion.staff maxdec=&decimals order=&order;
			where job_title contains 'Sales';
			var salary;
			class job_title;
		run;
		title;
   %end;
   %else %put ERROR: &numerrors errors.  Code not submitted.;
%mend salarystats;

%salarystats()
%salarystats(decimals=5,order=fudge)
