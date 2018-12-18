options nodate nonumber;
title; footnote;

ods csvall file="&path\myexcel.csv";

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods csvall close;
