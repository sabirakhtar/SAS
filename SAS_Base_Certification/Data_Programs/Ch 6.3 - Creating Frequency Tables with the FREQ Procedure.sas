title;
footnote;

options nodate nonumber ps=50 ls=78;
proc freq data=sashelp.orsales nlevels;
   *tables product_line;
run;
proc freq data=sashelp.orsales;
   tables product_line year;
run;

*** Two-Way Tables ***;
options nodate nonumber ps=50 ls=64;
proc freq data=sashelp.orsales;
   where product_line in ('Outdoors','Sports');
   tables product_line*year;
run;

proc freq data=sashelp.orsales;
   tables quarter product_category year*product_line;
run;

*** CROSSLIST Option ***;
options nodate nonumber ps=50 ls=74;
proc freq data=sashelp.orsales;
   where product_line in ('Outdoors','Sports');
   tables product_line*year / crosslist;
run;

*** Statistics ***;
options nodate nonumber ps=50 ls=74;
proc freq data=sashelp.orsales;
   where product_line in ('Outdoors','Sports');
   tables year / nocum nopercent;
   tables product_line*year / norow nocol nopercent nofreq;
   tables product_line / nopercent;
run;

*** NLEVELS Option ***;
options nodate nonumber ps=50 ls=74;
proc freq data=sashelp.orsales nlevels;
   tables year quarter 
          product_line product_category;
run;

*** Exercise 4 ***;
options nodate nonumber ps=50 ls=74;
proc freq data=sashelp.orsales nlevels;
   tables product_category / nocum;
   title 'Report One';
run;
