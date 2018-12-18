title;
footnote;

options nodate nonumber ps=30 ls=78;
proc means data=sashelp.prdsale maxdec=2 mean stddev;
   where country in ('CANADA');
   var predict actual;
   class country year;
run;

*** Statistics ***;
options nodate nonumber ps=30 ls=88;
proc means data=sashelp.prdsale;
run;

proc means data=sashelp.prdsale sum range;
run;

*** MAXDEC= Option ***;
options nodate nonumber ps=30 ls=88;
proc means data=sashelp.prdsale maxdec=2;
run;

*** VAR Statement ***;
options nodate nonumber ps=30 ls=64;
proc means data=sashelp.prdsale maxdec=2 n mean;
   var predict actual;
run;

*** CLASS Statement ***;
options nodate nonumber ps=30 ls=74;
proc means data=sashelp.prdsale maxdec=2 n mean;
   var predict actual;
   class country year;
run;

*** Exercise 5 ***;
options nodate nonumber ps=18 ls=74;
proc means data=sashelp.prdsal2 maxdec=0 sum median;
   where state in ('New York','Illinois');
   var actual;
   class state;
   label actual='Actual Retail Sales';
   title 'Product Sales Report';
   footnote 'Confidential';
run;
