*m105a01;

%macro reports;
   %daily
   %if &sysday=Friday then %weekly;
%mend reports;
