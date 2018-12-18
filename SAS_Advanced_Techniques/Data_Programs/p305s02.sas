data trans;
   drop Product21-Product24;
   array prod{21:24} Product21-Product24;
   set orion.shoestats;
   do ProductLine=21 to 24;
     Value=prod{ProductLine};
     output;
   end;
run;

proc print data=trans(obs=5);
   title 'The TRANS data set';
run;

title;
 
