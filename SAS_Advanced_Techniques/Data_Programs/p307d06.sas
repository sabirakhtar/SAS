data a;
X=1;
y='ABCD';
output;
X=1;
y='ZZZZ';
output;
run;
data b;
X=1;
Y='EFGHIJ';
run;

data c;
 merge a b;
 by X;
run;

proc contents data=c;
run;
proc print data=c;
run;
