*m102d07;

options nodate nonumber center;

title1 "&sysdate9";
title2 "&systime";

proc print data=sashelp.class;
run;

title1 "%sysfunc(today(),weekdate.)";
title2 "%sysfunc(time(),timeAMPM8.)";

proc print data=sashelp.class;
run;

title;
