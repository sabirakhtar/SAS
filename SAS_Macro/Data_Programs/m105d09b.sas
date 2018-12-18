*m105d09b;

%macro split (data=, var=);
   proc sort data=&data(keep=&var) out=values nodupkey;
      by &var;
   run;
   data _null_;
      set values end=last;
      call symputx('val'||left(_n_),&var);
      if last then call symputx('count',_n_);
   run;
   data
   %do i=1 %to &count;
      &&val&i
   %end;
   ;
      set &data;
      select(&var);
   %do i=1 %to &count;
      when("&&val&i") output &&val&i;
   %end;
      otherwise;
      end;
   run;
%mend split;

options mprint;

%split(data=orion.customer, var=country)
