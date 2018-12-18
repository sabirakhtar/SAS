libname mnth pcfiles path="&path\mnth2011.xls";

proc copy  in=orion out=mnth;
   select mnth7_2011 mnth8_2011 mnth9_2011;
run;

proc contents data=mnth._all_;
run;

libname mnth clear;
