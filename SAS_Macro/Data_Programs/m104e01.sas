*m104e01;

data staff;
   keep employee_ID job_title salary gender;
   set orion.staff;
   where job_title contains 'Audit';
run;

proc print data=staff;
	sum salary;
   title 'Audit Staff';
run;

title;
footnote;

