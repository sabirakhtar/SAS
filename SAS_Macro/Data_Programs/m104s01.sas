*m104s01;

%let job=Analyst;

data staff;
   keep employee_ID job_title salary gender;
   set orion.staff end=last;
   where job_title contains "&job";
   total+salary;
	count+1;
   *if last then call symputx('avg', total/count);
	if last then call symputx('avg', put(total/count,dollar9.));
run;

proc print data=staff;
	sum salary;
   title "&job Staff";
   footnote "Average Salary: &avg";
run;

title;
footnote;

