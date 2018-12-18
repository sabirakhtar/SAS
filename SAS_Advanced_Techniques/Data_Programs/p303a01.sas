data test;
   length x 4;
   x=1/10;
   y=1/10;
   put x=;
   put y=;

run;

data _null_;
   set test;
   put x=;
   put y=;
run;

