options nodate nonumber;
title; footnote;

ods pdf file="&path\p111e12.pdf" style=curve;
ods rtf file="&path\p111e12.rtf" style=journal;

title 'July 2011 Orders';
proc print data=orion.mnth7_2011;
run;

ods pdf close;
ods rtf close;
