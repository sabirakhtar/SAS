 /* Part a */
proc summary data=orion.customerdim;
   var CustomerAge;
   output out=average mean=AvgAge;
run;

proc print data=work.average;
  title 'This is the Average data set';
run;
 
 /* Part b */
 /* DATA step and work.average */
data agedif;
   if _N_=1 then set average(keep=AvgAge);
   set orion.customerdim(keep=CustomerID CustomerAge);
   AgeDifference=CustomerAge-AvgAge;
run;

/* PROC SQL and work.average */
proc sql;
   create table agedif as
     select AvgAge, 
            CustomerID, 
            CustomerAge, 
            CustomerAge-AvgAge as AgeDifference
       from orion.customerdim, 
            average;
quit;
  
 /* PROC SQL only */
proc sql;
   create table agedif as
   select mean(CustomerAge) as AvgAge, 
          CustomerID,
	        CustomerAge,
          CustomerAge-calculated AvgAge as AgeDifference
   from orion.customerdim;
quit;

/* Using the DATA step only */

data agedif;
   drop i TotAge;
   if _N_=1 then do i=1 to TotObs;
      set orion.customerdim(keep=CustomerAge) nobs=TotObs;
      TotAge+CustomerAge;
   end;
   set orion.customerdim(keep=CustomerID CustomerAge);
   AvgAge=TotAge / TotObs;
   AgeDifference=CustomerAge-AvgAge;
run;

 /* Part c */
proc print data=agedif(obs=5) noobs;
   var AvgAge CustomerID CustomerAge AgeDifference;	
   title 'The agedif Data Set';
run;

title;
