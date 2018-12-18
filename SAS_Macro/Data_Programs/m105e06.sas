*m105e06;

%macro salarystats(decimals=2,order=internal);
	options nolabel;
	title 'Salary Stats';
	proc means data=orion.staff maxdec=&decimals order=&order;
		where job_title contains 'Sales';
		var salary;
		class job_title;
	run;
	title;
%mend salarystats;

%salarystats()
%salarystats(decimals=5,order=fudge)
