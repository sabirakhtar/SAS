*m104s09;

title; 
footnote; 

*Part A;

proc sql noprint;
   select count(*) into :numobs
      from orion.customer_type;
   %let numobs=&numobs;
   select Customer_Type_ID into :ctype1-:ctype&numobs
      from orion.customer_type;
quit;

*Part B;

title 'Macro Variable beginning with CTYPE';

proc sql;
   select name, value
     from dictionary.macros
	where name like "CTYPE%";
quit;










