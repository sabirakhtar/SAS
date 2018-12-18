/*proc fcmp outlib=orion.functions.dev;
 function ReverseName(name $) $ 40;
    return(catx(' ',scan(name,2,','),scan(name,1,',')));
 endsub;
quit;*/

options cmplib=orion.functions;
proc format library=orion fmtlib;
 value $FmtRevName (default=40) 
                   ' '='Missing Name'
                 other=[ReverseName()];
run;

options fmtsearch=(orion);

title1 'Reverse Name Function';
title2 'Applied using Format Statement';

proc print data=orion.employeeaddresses(obs=5) noobs;
 var employeeid employeename city state postalcode country;
 format employeename $FmtRevName.;
run;

 
