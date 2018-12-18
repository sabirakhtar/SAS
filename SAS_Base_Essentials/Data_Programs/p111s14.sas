options nodate nonumber;
title; footnote;

ods tagsets.excelxp file="&path\p111e14.xls" 
                    style=Listing
                    options(doc='help'
                            embedded_titles='yes'
                            sheet_name='First Report');

title 'Customer Type Definitions';
proc print data=orion.customer_type;
run;

ods tagsets.excelxp options(sheet_name='Second Report');

title 'Country Definitions';
proc print data=orion.country;
run;

ods tagsets.excelxp close;
