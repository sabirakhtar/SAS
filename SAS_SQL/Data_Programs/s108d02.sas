*** s108d02 ***;

title 'Tables in the ORION Library';
proc print data=sashelp.vtable label;
   var memname nobs nvar;
   where libname='ORION';
run;

title 'SAS Objects by Library';
proc tabulate data=sashelp.vmember format=8.;
   class libname memtype;
   keylabel N=' ';
   table libname, memtype/rts=10 
         misstext='None';
   where libname in ('ORION','SASUSER','SASHELP');
run;
title;
