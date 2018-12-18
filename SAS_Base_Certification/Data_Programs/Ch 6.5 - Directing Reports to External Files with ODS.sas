options nodate nonumber ps=25 ls=64;
title;
footnote;

*** ODS HTML Statement ***;
ods html file='gnp.html';
proc print data=sashelp.gnp;
   where year(date)=1985;
   title 'My Report';
run;
proc means data=sashelp.gnp;
   where year(date)=1985;
   var gnp;
run;
ods html close;

ods html file='rent.html';
proc print data=sashelp.rent;
   title 'Rent Report';
run;
ods html close;

*** ODS RTF and PDF Statements ***;
ods rtf file='shoes.rtf';
ods pdf file='shoes.pdf';
proc freq data=sashelp.shoes;
   tables region;
   title 'Region Frequency Table';
run;
ods rtf close;
ods pdf close;

*** Multiple Destinations ***;
ods listing;
ods html file='shoes.html';
ods rtf file='shoes.rtf';
ods pdf file='shoes.pdf';
proc print data=sashelp.shoes;
   where region='Asia';
   title 'Asia Report';
run;
ods _all_ close;
ods listing;

*** Destinations Used with Excel ***;
ods csvall file='shoes.csv';
ods tagsets.excelxp file='shoes.xml';
ods msoffice2k file='shoes.html';
proc print data=sashelp.shoes;
   where region='Asia';
   title 'Asia Report';
run;
ods _all_ close;
ods listing;

*** Exercise 6 ***;
ods listing;
ods html file='steel.html';
ods tagsets.excelxp file='steel.xml';
proc sort data=sashelp.steel out=steel;
   by date;
run;
proc print data=steel;
run;
proc freq data=steel;
   tables date;
run;
ods _all_ close;
ods listing;

