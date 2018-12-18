proc contents data=orion.qtr1_2011;
run;

proc contents data=orion.qtr2_2011;
run;

proc append base=work.ytd 
            data=orion.qtr1_2011;
run;

proc append base=work.ytd 
            data=orion.qtr2_2011 force;
run;
