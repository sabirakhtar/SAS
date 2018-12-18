*m105d11b;

%macro printlib(lib=WORK,obs=5);
   %let lib=%upcase(&lib);
   data _null_;
      set sashelp.vstabvw end=final;
      where libname="&lib";
      call symputx('dsn'||left(_n_),memname);
      if final then call symputx('totaldsn',_n_);
   run;
   %do i=1 %to &totaldsn;
      proc print data=&lib..&&dsn&i(obs=&obs);
      title "&lib..&&dsn&i Data Set";
      run;
  %end;
%mend printlib;

options mprint;

%printlib(lib=orion)
