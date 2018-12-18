*** s106d02 ***;
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

title 'UNION with Defaults';
proc sql;
select * from work.train_a
union
select * from work.train_b 
   where EDate is not missing;
quit;
title;

title 'UNION with CORR Modifier';
proc sql;
select * from work.train_a
union corr
select * from work.train_b 
   where EDate is not missing;
quit;
title;
