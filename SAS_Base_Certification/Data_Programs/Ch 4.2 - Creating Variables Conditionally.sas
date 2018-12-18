data golf.balls;
   length mfg $ 8 type $ 8;
   format price dollar8.2;
   mfg='Crew'; type='Distance'; price=8.10;   output;
               type='Spin';     price=8.25;   output;		  
               type='Titanium'; price=9.50;   output;
   mfg='Hi-fly'; type='X12000'; price=13.75;  output;
                 type='X22000'; price=14.60;  output;
   mfg='White'; type='Strata';  price=10.60;  output;
                type='Aero';    price=12.30;  output;
                type='XL';      price=14.50;  output;
                type='Flite';   price=16.20;  output;
run;

*** IF-THEN / ELSE ***;
data newprice;
   set golf.balls;
   if mfg='Crew' then saleprice = price * 0.75;
   else if mfg='Hi-fly' then saleprice = price * 0.70;
   else if mfg='White' then saleprice = price * 0.90;
   format price saleprice dollar8.2;
run;
proc print;
run;

*** SELECT / WHEN / OTHERWISE ***;
data newprice;
   set golf.balls;
   select(mfg);
     when('Crew') saleprice=price*0.75;
     when('Hi-fly') saleprice=price*0.70;
     when('White') saleprice=price*0.90;
	 otherwise;
   end;
   format price saleprice dollar8.2;
run;
proc print;
run;

*** IF-THEN DO / ELSE DO ***;
*** Exercise 2 ***;
data newprice;
   *infile 'raw-data-file';
   *input mfg $ type $ price;
   set golf.balls;
   length saletype $ 18;
   if mfg='Crew' then do;
      pct=0.75;
      saleprice = price * pct; 
      saletype = '25% off';
   end;
   else if mfg='Hi-fly' then do;
      pct=0.70;
      saleprice = price * pct;
      saletype = '30% off';
   end;
   else do;
      pct=0.90;
      saleprice = price * pct;
	  saletype = '10% Storewide Sale';
   end;
   format price saleprice dollar8.2;
run;
proc print;
run;

*** SELECT / WHEN DO / OTHERWISE ***;
data newprice;
   *infile 'raw-data-file';
   *input mfg $ type $ price;
   set golf.balls;
   length saletype $ 18;
   select(mfg);
     when('Crew') do;
       pct=0.75;
       saleprice = price * pct;
       saletype = '25% off';
     end;
     when('Hi-fly') do;
       pct=0.70;
       saleprice = price * pct;
	   saletype = '30% off';
     end;
     otherwise do;
       pct=0.90;
       saleprice = price * pct;
	   saletype = '10% Storewide Sale';
     end;
   end;
   format price saleprice dollar8.2;
run;
proc print;
run;

*** SELECT / WHEN / OTHERWISE ***;
data rev;
   input revenue;
   datalines;
11000 
13000
25000
24000
;
run;
data new;
   set rev;
   length target $ 5;
   select; 
     when (12000<=revenue<=24000) target='goal'; 
     when (revenue<12000) target='below';
     when (revenue>=24000) target='above';
     otherwise;
   end;
run; 
proc print;
run;


