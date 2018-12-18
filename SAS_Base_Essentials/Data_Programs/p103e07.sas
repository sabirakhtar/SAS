libname custfm pcfiles path="&path\custfm.xls";

proc contents data=custfm._all_;
run;

libname custfm clear;



