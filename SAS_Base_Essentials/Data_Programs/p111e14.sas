options nodate nonumber;
title; footnote;

ods tagsets.excelxp file="&path\p111e14.xls" 
                    style=Listing
                    options(doc='help');

title 'Customer Type Definitions';
proc print data=orion.customer_type;
run;

*ods tagsets.excelxp options();

title 'Country Definitions';
proc print data=orion.country;
run;

ods tagsets.excelxp close;
