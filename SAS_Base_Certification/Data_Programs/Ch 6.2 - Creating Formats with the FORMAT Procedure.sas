title;
footnote;
options nodate nonumber ps=30 ls=64;

*** Exercise 3 ***;
proc format;
   value $gender 'F'  = 'Female'
                 'M'  = 'Male'
                other = 'Miscoded';
   value wtrange low - <100 = 'Under 100 lbs'
                 100 - high = '100+ lbs'; 
run;
proc print data=sashelp.class;
   var name sex weight;
   format sex $gender. weight wtrange.;
run;

*** Single Values ***;
proc format;
   value code     '0'  = 'NO'
                  '1'  = 'YES'
	 	      '3','4'  = 'UNSURE'
                   .   = 'MISSING';
run;

*** Ranges ***;
proc format;
   value group  0 - 50  = 'First Half'
               51 - 100 = 'Second Half';
run;
data format1;
   input number;
   datalines;
76
43
50.5
;
run;
proc print data=format1;
   format number group.;
run;

*** Creating and Using Formats ***;
data test;
   input name $ test $;
   datalines;
Jane D
Tom B
Mark Z
Sue A
;
run;
proc format;
   value $testfmt 'A' = 'Excellent'
                  'B' = 'Good'
                  'C' = 'Average'
              'D','F' = 'Needs Improvement'
	 		      ' ' = 'Incomplete'
			    other = 'Miscoded';
run;
proc print data=test;
   format test $testfmt.;
run;
