data work.enroll;
   infile 'enrollment.dat';
   input @1 first_name $8. @9 last $9. 
         @20 state2 $2. @23 _age_ 2. 
         @26 enrolldate date9.;
run;

*The SORT procedure is creating an updated data set;
proc sort data=work.enroll 
          out=project.enroll;
   by last;
run;

/* The PRINT procedure is creating a report. */
proc print data=project.enroll;
   var last state2 _age_ enrolldate;
   format enrolldate mmddyy10.;
run;

proc contents data=project._all_ nods;
run;

options ls=80 nodate nonumber;
proc contents data=project.enroll;
run;

proc print data=project.enroll;
run;
