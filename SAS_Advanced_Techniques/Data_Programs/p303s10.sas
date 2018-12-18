 /*  Parts a & b */
data olderthan60 youngerthan60 / view=youngerthan60;
   set orion.employeepayroll;
   Age=int(yrdif(BirthDate, today(), 'act/act'));
   if Age >= 60 then output olderthan60;
   else output youngerthan60;
   format BirthDate EmployeeHireDate EmployeeTermDate date9.;
run;

 /*  Part c */
proc print data=olderthan60(obs=5) noobs;
   title 'Olderthan60 Data Set';
run;

 /*  Part d */
proc print data=youngerthan60(obs=5) noobs;
   title 'Youngerthan60 Data Set';
run;

 /*  Part e */
proc print data=olderthan60(obs=5) noobs;
   title 'Olderthan60 Data Set';
run;
