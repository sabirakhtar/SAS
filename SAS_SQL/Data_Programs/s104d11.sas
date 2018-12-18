*** s104d11 ***;  
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

proc sql;
title 'Left Join - C and then T';
select * 
   from customers left join transactions
   on customers.ID = transactions.ID;
title 'Right Join - T and then C';
select * 
   from transactions right join customers 
   on customers.ID = transactions.ID;
quit;
title;
