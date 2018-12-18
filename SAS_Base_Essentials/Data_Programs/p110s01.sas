data work.thirdqtr;
   set orion.mnth7_2011 orion.mnth8_2011 orion.mnth9_2011;
run;

proc print data=work.thirdqtr;
run; 
