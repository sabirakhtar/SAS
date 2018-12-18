data test;
   length x 3;
   x=72345;
   put x=;
run;

data _null_;
   set test;
   put x=;
run;
