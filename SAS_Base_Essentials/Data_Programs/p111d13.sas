options nodate nonumber;
title; footnote;

ods html file="&path\example.html";
ods pdf file="&path\example.pdf";
ods rtf file="&path\example.rtf";

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods html close;
ods pdf close;
ods rtf close; 

*ods _all_ close;
*ods html;
