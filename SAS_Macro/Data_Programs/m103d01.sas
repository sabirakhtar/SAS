*m103d01;

options mcompilenote=all;

%macro time;
   %put The current time is %sysfunc (time(),timeAMPM.).;
%mend time;

%time
