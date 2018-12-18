options nodate nonumber;
title; footnote;

ods tagsets.excelxp file="&path\p111e13.xls" style=Listing;

title 'Customer Type Definitions';
proc print data=orion.customer_type;
run;

title 'Country Definitions';
proc print data=orion.country;
run;

ods tagsets.excelxp close;
