  /* delete qtr2007a.xls and qtr2007b.xls */
  /*        if they already exist         */

********** Creating Excel Worksheets with DATA Step **********;
libname orionxls pcfiles path="&path\qtr2007a.xls";

data orionxls.qtr1_2007;
   set orion.qtr1_2007;
run;

data orionxls.qtr2_2007;
   set orion.qtr2_2007;
run;

proc contents data=orionxls._all_;
run;

libname orionxls clear;

********** Creating Excel Worksheets with PROC COPY Step **********;
libname orionxls pcfiles path="&path\qtr2007b.xls";

proc copy  in=orion out=orionxls;
   select qtr1_2007 qtr2_2007;
run;

proc contents data=orionxls._all_;
run;

libname orionxls clear;


