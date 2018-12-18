data one;
  input X Y:$1.;
datalines;
1 a
1 d
4 c
5 g
;
run;

data two;
  input X Z:$1.;
datalines;
1 f
1 r
1 s
3 t
4 w
;
run;

data three;
  merge one two;
  by X;
run;

proc print data=three;
run;
