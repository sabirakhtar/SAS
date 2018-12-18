*** s104d13 ***;
/****************************************************************************/
/* This program uses %INCLUDE statement to create a Temporary SAS data set. */
/* The %INCLUDE  statement includes a full path for Microsoft Windows and   */
/* UNIX.                                                                    */
/*                                                                          */
/* For  z/OS:                                                               */
/*      Replace  the %INCLUDE statement with the following statement:       */
/*               %include "&path..rawdata(name-file)";                      */
/****************************************************************************/


%include "&path/s104d00a.sas" /source2; /* Windows and Unix */

proc sort data=customers; by ID; run;
proc sort data=transactions; by ID; run;
data merged; 
   merge customers transactions;
   by ID;
run;
proc print data=merged noobs;
run;

%include "&path/s104d00a.sas" /source2; /* Windows and Unix */

proc sql;
select *
   from customers c full join transactions t
   on c.ID=t.ID;
quit;

proc sql;
select coalesce(c.ID,t.ID) as ID,
       Name, Action, Amount
   from customers as c full join transactions as t
   on c.ID=t.ID;
quit;
