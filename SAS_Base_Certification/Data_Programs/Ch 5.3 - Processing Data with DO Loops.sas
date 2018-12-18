*** Index Variable ***;
options ls=64;
data training;
   miles=30;
   do weeks = 1 to 6;
     miles+miles*0.04;
     output;
   end;
run;
proc print noobs;
run;

*** SET Statement ***;
data runners;
   input name $ miles pct;
   datalines;
Jill 24 0.05
Ray  28 0.04
Mark 30 0.05
;
run;
data training;
   set runners;
   do weeks=1 to 6;
     miles+miles*pct;
	 output;
   end;
run;
proc print;
run;

*** INFILE/INPUT Statements ***;
data training;
  infile 'runners.dat';
  input name $ miles pct;
  do weeks=1 to 6;
    miles+miles*pct;
	output;
  end;
run;
proc print;
run;

*** Nested DO Loops ***;
data training;
   miles=30;
   pct=0.02;
   do month=1 to 3;
      pct+0.01;
      do weeks = 1 to 4;
         miles+miles*pct;
         output;
      end;
   end;
run;
options ls=64;
proc print noobs;
run;

data training;
   miles=30;
   pct=0.02;
   do month=1 to 3;
      pct+0.01;
      do weeks = 1 to 4;
         miles+miles*pct;
      end;
   end;
run;
proc print noobs;
run;

*** Additional Specifications ***;
data training;
   miles=30;
   do date=today()+30, today()+100;
     miles+miles*0.10;
     output;
   end;
run;
proc print;
  format date date9.;
run;

*** Conditional Specifications ***;
data training;
   miles=30;
   do until(miles>50);
     week+1;
     miles+miles*0.04;
     output;
   end;
run;
proc print;
run;

data training;
   miles=30;
   do while(miles<=50);
     week+1;
     miles+miles*0.04;
     output;
   end;
run;
proc print;
run;

data training;
   miles=45;
   do until(miles>40);
     week+1;
     miles+miles*0.04;
     output;
   end;
run;
proc print;
run;

*** Combined Specifications ***;
data training;
   miles=30;
   do weeks=1 to 30 until(miles>50);
     miles+miles*0.02;
     if weeks=26 then output;
   end;
run;
proc print;
run;
