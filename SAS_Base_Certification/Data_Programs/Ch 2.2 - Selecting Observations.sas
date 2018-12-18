*** FIRSTOBS= and OBS= Options ***;
data work.all;
   set sashelp.retail;
run;
proc print;
run;
data work.ten;
   set sashelp.retail(obs=10);
run;
proc print;
run;
data work.portion;
   set sashelp.retail(firstobs=5 obs=10);
run;
proc print;
run;

data shoes(firstobs=101 obs=200);
   set sashelp.shoes;
run;
data shoes;
   set sashelp.shoes(firstobs=101 obs=200);
run;
proc print data=sashelp.shoes(firstobs=101 obs=200);
run;

*** Operators ***;
data names;
   input name $;
   datalines;
Mark
Marcia
Mickey
Matthew
Michael
;
run;
data new;
   set names;
   where name like 'M__k%';
run;
proc print;
run;

*** Subsetting Statements ***;
data golf.supplies;
   length mfg $ 6 type $ 8;
   mfg='Crew'; type='Distance'; price=8.10;   output;
               type='Spin';     price=8.25;    output;
               type='Titanium'; price=9.50;   output;
   mfg='Hi-fly'; type='X12000'; price=13.75;  output;
                 type='X22000'; price=14.60;  output;
   mfg='White'; type='Strata';  price=10.60;  output;
                type='Aero';    price=12.30;  output;
                type='XL';      price=14.50;  output;
                type='Flite';   price=16.20;  output;
run;

data work.newprice;
   set golf.supplies;
   saleprice=price*0.75;
   if not (saleprice > 10) then delete;
   *if saleprice > 10;
   *where saleprice > 10;
run;
proc print;
run;

data work.newprice;
   set golf.supplies;
   where mfg='White';
   saleprice=price*0.75;
   if saleprice > 10;
run;
proc print;
run;

data sales;
   format DATE 8. STATE $8. PRODUCT $10. actual predict 8.;
   set sashelp.prdsal3(keep=state product actual predict date);
   where state in ('Florida','Texas');
run;
proc print;
run;

data subset;
   set sales;
   *where actual > predict;
   *where difference ge 1000;
   *where product in ('CHAIR','SOFA');
   *where state='Texas' and date<'01JAN1998'd;
   *if difference < 500;
   difference=actual-predict;
   *if state='Texas';
   *if difference between 500 and 1000;
   *if product='CHAIR' and difference ge 100;
run;
proc print;
run;
proc contents data=sales position;
run;

*** Exercise 3 ***;
data subset;
  set sales;
  where state='Texas' and date<'01JAN1998'd;
  difference=actual-predict;
  if difference>1000;
run;
proc print;
run; 
