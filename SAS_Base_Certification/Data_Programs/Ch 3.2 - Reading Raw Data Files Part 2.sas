*** Column Input ***;
data work.kids2;
   infile 'kids2.dat';
   input name $ 1-8 
         siblings 10 
         bdate $ 12-21 
         allowance $ 23-24 
         hobby1 $ 26-35 
         hobby2 $ 36-45 
         hobby3 $ 46-55;
run;
proc print;
run;

*** Formatted Input ***;
data new;
   data='30JAN1999'd;
run;
proc print;
run;

data new;
   input num1 8.2;
   put _all_;
   datalines;
12345678 
1234.567
;
run;

data work.kids2;
   infile 'kids2.dat';
   input @1 name $8. 
         @10 siblings 1. 
         @12 bdate mmddyy10. 
         @23 allowance comma2. 
         @26 hobby1 $10.
         @36 hobby2 $10.
         @46 hobby3 $10.;
run;
proc print;
run;

*** List Input ***;
data work.kids3;
   length hobby1 hobby2 hobby3 $ 10;
   infile 'kids3.dat';
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 $ 
         hobby2 $ 
         hobby3 $;
run;
proc print;
run;

data work.kids3;
   infile 'kids3.dat';
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance  comma2. 
         hobby1 : $10. 
         hobby2 : $10. 
         hobby3 : $10.;
run;
proc print;
run;

data example;
   infile 'colonmod.dat';
   input name $ salary:comma10. state $;
run;
proc print;
run;
data example;
   infile 'colonmod.dat';
   input name $ salary comma10. state $;
run;
proc print;
run;

data example1;
   infile 'colonmod1.dat';
   input name $ bdate:date9. state $;
run;
proc print;
run;
data example;
   infile 'colonmod1.dat';
   input name $ bdate date9. state $;
   x=substr(state,1,1);
run;
proc print;
   format state $quote20.;
run;

data work.kids4;
   length hobby1 hobby2 hobby3 $ 10;
   infile 'kids4.dat' dlm=',';
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10. 
         hobby3 : $10.;
run;
proc print;
run;

data work.kids5;
   infile 'kids5.dat' /*dlm=','*/ dsd;
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10.  
         hobby3 : $10.;
run;
proc print;
run;

data work.kids5a;
   infile 'kids5a.dat' dlm='/' dsd;
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10.  
         hobby3 : $10.;
run;
proc print;
run;

data work.kids6;
   infile 'kids6.dat' missover;
   input name $ 
         siblings 
         bdate : mmddyy10. 
         allowance : comma2. 
         hobby1 : $10. 
         hobby2 : $10.  
         hobby3 : $10.;
run;
proc print;
run;

*** Exercise 2 ***;
data kids7;
  infile 'kids7.dat' dlm='!' missover;
  input first $ 1-9
        last $ 10-19
		age 20-21
		savings : comma8.
		sibling1 $
		sibling2 $
		sibling3 $;
run;
proc print;
run;

