*m105d09a;

%macro split (data=, var=);
   proc sort data=&data(keep=&var) out=values nodupkey;
      by &var;
   run;
   data _null_;
      set values end=last;
      call symputx('val'||left(_n_),&var);
      if last then call symputx('count',_n_);
   run;
   %put _local_;
%mend split;

%split(data=orion.customer, var=country)
