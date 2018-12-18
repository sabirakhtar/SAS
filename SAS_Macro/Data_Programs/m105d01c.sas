*m105d01c;

%macro reports;
   %include "&path\daily.sas";
   %if &sysday=Friday %then %do;
      %include "&path\weekly.sas";
   %end;
%mend reports;

%reports