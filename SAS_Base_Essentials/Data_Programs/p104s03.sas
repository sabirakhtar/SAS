proc print data=orion.order_fact;
run;

options ls=max;
proc print data=orion.order_fact;
run;

options ls=96;

proc print data=orion.order_fact headings=v;
run;


