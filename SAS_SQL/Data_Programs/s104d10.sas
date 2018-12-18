*** s104d10 ***;  
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
title 'Full Join';
select * 
   from customers c full join transactions t
   on c.ID = t.ID;
quit;
title;
