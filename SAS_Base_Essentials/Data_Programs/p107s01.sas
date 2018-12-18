options validvarname=v7;
*libname custfm excel "&path/custfm.xlsx"; 
*libname custfm pcfiles path="&path/custfm.xlsx";

proc contents data=custfm._all_;
run;

data work.males;
   set custfm.'Males$'n;
   keep First_Name Last_Name Birth_Date;
   format Birth_Date year4.;
   label Birth_Date='Birth Year';
run;

proc print data=work.males label;
run;

libname custfm clear;

/* Alternate solution */

options validvarname=v7;
libname custfm xlsx "&path/custfm.xlsx"; 

proc contents data=custfm._all_;
run;

data work.males;
   set custfm.Males;
   keep First_Name Last_Name Birth_Date;
   format Birth_Date year4.;
   label Birth_Date='Birth Year';
run;

proc print data=work.males label;
run;

libname custfm clear;
