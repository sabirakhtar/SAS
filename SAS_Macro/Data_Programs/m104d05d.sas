*m104d05d;

proc sql flow;
   select name, value
      from dictionary.macros
      where scope='GLOBAL'
      order by name;
quit;

%macro putALL;
	proc sql flow;
   	select name, value
    		from dictionary.macros
    	  	where scope='GLOBAL'
			order by name;
	quit;
%mend putALL;

options nomprint;

%putALL
