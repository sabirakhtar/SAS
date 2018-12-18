*** Reading Raw Data Files ***;
data work.kids;
   infile 'kids.dat';
   input name $ 1-8 siblings 10 
         @12 bdate mmddyy10. 
         @23 allowance comma2. 
         hobby1 $ hobby2 $ hobby3 $;
run;
options ls=64;
proc contents position;
run;
proc print;
run; 

*** Data Errors ***;
data work.kids1;
   infile 'kids1.dat';
   input name $ 1-8 siblings 10 
         @12 bdate mmddyy10. 
         @23 allowance comma2. 
         hobby1 $ hobby2 $ hobby3 $;
run;
proc print;
run; 

data work.kids;
   infile 'kids.dat';
   input name $ 1-8 siblings 10 
         @12 bdate mmddyy10. 
         @23 allowance comma2. 
         hobby1 hobby2 $ hobby3 $;
run;
proc print;
run; 

*** Datalines ***;
data work.kids;
   input name $ 1-8 siblings 10 
         @12 bdate mmddyy10. 
         @23 allowance comma2. 
         hobby1 $ hobby2 $ hobby3 $;
   datalines;
Chloe    2 11/10/1995 $5Running Music Gymnastics
Travis   2 1/30/1998  $2Baseball Nintendo Reading
Jennifer 0 8/21/1999  $0Soccer Painting Dancing
;
run;

proc print;
run; 
