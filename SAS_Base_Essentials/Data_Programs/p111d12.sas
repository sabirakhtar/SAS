options nodate nonumber;
title; footnote;

ods html file="&path\myreport.html";

proc freq data=orion.sales;
   tables Country;
run;

ods html close;
