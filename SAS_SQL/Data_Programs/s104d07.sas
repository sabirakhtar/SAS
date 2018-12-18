*** s104d07 ***;
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
title 'All Customers';
select *
   from customers as c
     left join
     transactions as t
   on c.ID=t.ID;
quit;
title;
