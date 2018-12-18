*m104e09;

title; 
footnote; 

*Part B;

title 'Macro Variable beginning with CTYPE';

proc sql;
   select name, value
     from dictionary.macros
	where name like "CTYPE%";
quit;
