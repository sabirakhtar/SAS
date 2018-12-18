ods html close; ods html;
prc print data=sashelp.class;
run;
proc means data=sashelp.class
run;

ods html close; ods html;
proc print data=sashelp.class;
run;
proc means data=sashelp.class;
run;

ods html close; ods html;
proc print data=sashelp.class;
   title 'My PROC PRINT Output;
run;
proc means data=sashelp.class;
run;

ods html close; ods html;
proc print data=sashelp.class;
   title 'My PROC PRINT Output';
run;
proc means data=sashelp.class;
run;
