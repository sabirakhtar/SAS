 /* Create totals summary data set */
data donations;
   set orion.employeedonations;
   TotalDonation=sum(of Qtr1-Qtr4);
run;

proc summary data=donations;
   var TotalDonation;
   output out=totals mean=AvgDonation;
run;

 /* DATA step and work.totals */
data compare;
   if _N_=1 then set totals;
   set donations;
   Difference=TotalDonation-AvgDonation;
run;

 /* PROC SQL and work.totals */
 /*
proc sql;
   create table donations as
   select EmployeeID,
          Qtr1,
          Qtr2,
          Qtr3,
          Qtr4,
	        Recipients,
          PaidBy,
          sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalDonation
   from orion.employeedonations;

proc summary data=donations;
   var TotalDonation;
   output out=totals mean=AvgDonation;
run;

proc sql;
   create table compare as
      select AvgDonation, 
             donations.*, 
             TotalDonation-AvgDonation as Difference
         from totals, 
              donations;
quit;
 */
 /* PROC SQL only */
 /*
proc sql;
   create table compare as
     select mean(sum(Qtr1, Qtr2, Qtr3, Qtr4)) as AvgDonation,
            EmployeeDonations.*, 
            sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalDonation,
            calculated TotalDonation-calculated AvgDonation as
               Difference
       from orion.employeedonations;
quit;
 */
 /* DATA Step only */
 /*
data compare;
   drop i;
   if _N_=1 then do i=1 to TotObs;
      set orion.employeedonations(keep=Qtr1-Qtr4) nobs=TotObs;
      Total+sum(of Qtr1-Qtr4);
   end;
   set orion.employeedonations;
   TotalDonation=sum(of Qtr1-Qtr4);
   AvgDonation=Total/TotObs;
   Difference=TotalDonation-AvgDonation;
run;
 */
 /* Part b */
proc print data=compare(obs=5) noobs;
   var EmployeeID Qtr1 Qtr2 Qtr3 Qtr4
       TotalDonation AvgDonation Difference;	
   title 'The compare Data Set';
run;
title;
