proc print data=sashelp.class;
run;

proc print data=sashelp.class noobs;
run;

proc print data=sashelp.class;
run;
proc means data=sashelp.class;
run;

ods html close; ods html;
proc print data=sashelp.class;
run;
proc means data=sashelp.class;
run;
