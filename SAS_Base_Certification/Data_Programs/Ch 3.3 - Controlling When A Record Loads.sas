*** Multiple Input Statements ***;
data work.kids8;
   infile 'kids8.dat';
   input name $ 1-8 siblings 10; 
   input @1 bdate mmddyy10. @12 allowance comma2.; 
   input hobby1:$10. hobby2:$10. hobby3:$10.;
run;
options ls=64;
proc print;
run; 

*** Line Pointer Controls ***;
data work.kids8;
   infile 'kids8.dat';
   input name $ 1-8 siblings 10 / 
         @1 bdate mmddyy10. @12 allowance comma2. /
         hobby1:$10. hobby2:$10. hobby3:$10.;
run;
proc print;
run;

data work.kids8;
   infile 'kids8.dat';
   input #1 name $ 1-8 siblings 10  
         #2 @1 bdate mmddyy10. @12 allowance comma2. 
         #3 hobby1:$10. hobby2:$10. hobby3:$10.;
run;
proc print;
run;  

*** Single @ ***;
data work.kids9;
   infile 'kids9.dat';
   input name $ 1-8 state $ 10-11 @;
   if state='IN' then 
      input @13 bdate mmddyy10. @24 allowance comma2. 
            hobby1:$10. hobby2:$10. hobby3:$10.;
   else input @13 hobby1:$10. hobby2:$10. hobby3:$10.;
run;
proc print;
run;

*** Double @@ ***;
data work.kids10;
   infile 'kids10.dat';
   input name $ state $ @@;
run;
proc print;
run;
