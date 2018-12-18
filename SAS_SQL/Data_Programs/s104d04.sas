*** s104d04 ***;  
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

title 'Selected Columns with a Table Qualifer';
proc sql;
select c.ID, Name, Action, Amount
   from customers as c, transactions as t
   where c.ID=t.ID;
quit;
title;


*** Using a DATA Step Merge ***;

proc sort data=customers;
   by ID;
run;

proc sort data=transactions;
   by ID;
run;

data orders;
   merge customers(in=c)
         transactions(in=t);
   by ID;
   if c=1 and t=1;
run;
proc print data=orders;
run;
