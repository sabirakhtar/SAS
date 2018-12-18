/* Delete all Global Macro Variables */

%macro cleanup;
%local delete;
proc sql noprint;
   select name into :delete separated by ' '
     from dictionary.macros
	 where scope='GLOBAL';
quit;
%symdel &delete;
%mend cleanup;

%cleanup


