*m105d11a;

%macro printlib(lib=WORK);
   %let lib=%upcase(&lib);
   data _null_;
      set sashelp.vstabvw end=final;
      where libname="&lib";
      call symputx('dsn'||left(_n_),memname);
      if final then call symputx('totaldsn',_n_);
   run;
   %put _local_;
%mend printlib;

%printlib(lib=orion)
