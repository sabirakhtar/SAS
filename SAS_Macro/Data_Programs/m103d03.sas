*m103d03;

libname orion "&path";
options mstored sasmstore=orion;

%macro time / store source;
   %put The current time is %sysfunc (time(),timeampm.).;
%mend time;

%time 

