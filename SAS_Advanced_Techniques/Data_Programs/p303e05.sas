data five;
   length Num5 5 Num8 8;
   do Num8=1e10 to 1e13 by 1e11;
      Num5=Num8;
      output;
   end;
run;

proc print data=five;
   title 'Reducing the length of numeric data to 5';
   format Num5 Num8 20.;
run;
