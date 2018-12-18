*** s106d06 ***;
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

  /* Step 1: DATA STEP */
data trained;
   set train_a train_b;
run;
proc print data=trained label noobs;
run;

  /* Step 2: PROC SQL STEP */
proc sql;
select * from train_a
outer union corr
select * from train_b;
quit;

