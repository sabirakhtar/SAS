*** Automatic Character-to-Numeric ***;
options ls=70;
data numeric;
   num1=5;
   char='6';
   num2=num1+char;
run;
proc print;
run;

*** Automatic Numeric-to-Character ***;
data character;
   num=1234567;
   char=substr(num,3,1);
run;
proc print;
run;

*** INPUT ***;
*** Exercise 4 ***;
data numeric;
   length num1-num8 8;
   num1='162400';
   num2='$162,400';
   num3='49275.937';
   num4='+24';
   num5='-73.5';
   num6='01234';
   num7='52E3';
   num8='01/01/1960';
run;
data numeric;
   num1=input('162400',6.);
   num2=input('$162,400',comma8.);
   num3=input('49275.937',9.);
   num4=input('+24',3.);
   num5=input('-73.5',5.);
   num6=input('01234',5.);
   num7=input('52E3',4.);
   num8=input('01/01/1960',mmddyy10.);
run;
proc print;
run;

*** PUT ***;
*** Exercise 4 ***;
data character;
   char1=162400||' ';
   char2=49275.937||' ';
   char3=-73.5||' ';
   char4=52E3||' ';
   char5=0||' ';
run;
data character;
   char1=put(162400,dollar8.);
   char2=put(49275.937,comma10.3);
   char3=put(-73.5,5.1);
   char4=put(52E3,5.);
   char5=put(0,date9.);
run;
proc print;
   format char1-char5 $9.;
run;

*** INPUT and PUT ***;
data Personnel;
   length Hired $ 9;
   input First $ Last $ Hired $ SSN;
   datalines;
Samatha Jones 27MAR2003 444444444
Timothy Peters 01SEP2006 999999999
;
run;
data NewPersonnel;
   set Personnel;
   NewHired=input(Hired,date9.);
   TempSSN=put(SSN,9.);
   NewSSN=catx('-',substr(TempSSN,1,3),
                   substr(TempSSN,4,2),
                   substr(TempSSN,6));
run;
proc print;
run;

data NewPersonnel;
   set Personnel;
   Hired=input(Hired,date9.);
   SSN=put(SSN,9.);
run;
proc print;
run;

data NewPersonnel;
   set Personnel(rename=(Hired=TempH SSN=TempS));
   Hired=input(TempH,date9.);
   SSN=put(TempS,9.);
   drop TempH TempS;
run;
proc contents;
run;
proc print;
run;

