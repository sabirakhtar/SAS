proc contents data=orion.saleshistory;
run;

proc datasets lib=orion nolist;
   contents data=saleshistory;
quit;


