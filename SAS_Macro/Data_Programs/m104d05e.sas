*m104d05e;

%macro deleteALL;
   proc sql noprint;
      select name into: vars separated by ' '
         from dictionary.macros
         where scope='GLOBAL';
   quit;
   %symdel &vars;
%mend deleteALL;

%deleteALL
