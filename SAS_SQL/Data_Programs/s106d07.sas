*** s106d07 ***;
/****************************************************************************/
/* This program uses  %INCLUDE statement to create a Temporary SAS data set.*/
/* The %INCLUDE  statement includes a full path for Microsoft Windows.      */
/*                                                                          */
/* For UNIX or SAS onDemand:                                                */
/*      Replace  the %INCLUDE statement with the following statement:       */
/*               %include "&path/name-file.sas";                            */
/*                                                                          */
/* For  z/OS:                                                               */
/*      Replace  the %INCLUDE statement with the following statement:       */
/*               %include "&path..rawdata(name-file)";                      */
/****************************************************************************/

%include "&path\s106d00.sas" /source2;

title 'Which Employees Have Completed';
title2 'Training A, But Not Training B';
proc sql;
select ID, Name from train_a
except
select ID, Name from train_b
   where EDate is not missing;
quit;
title;
