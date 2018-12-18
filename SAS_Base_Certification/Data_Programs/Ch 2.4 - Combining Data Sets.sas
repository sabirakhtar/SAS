*** Appending ***;
data work.ytd;
   month='JAN'; country='US'; Target=2000000; output;
   month='FEB'; country='US'; Target=2100000; output;
   month='MAR'; country='US'; Target=2500000; output;
run;
data work.apr;
   month='APR'; Target=3600000; output;
run;
proc append base=work.ytd data=work.apr;
run;
data work.may;
   month='MAY'; Target=3500000; Sales=3650000; output;
run;
proc append base=work.ytd data=work.may;
run;
proc append base=work.ytd data=work.may force;
run;
proc print;
run;

*** Concatenating ***;
data oct;
   region='East'; date='01OCT2006'd; sales=1600000; output;
   region='West'; date='01OCT2006'd; sales=2100000; output;
run;
data nov;
   region='East'; date='01NOV2006'd; sales=2500000; output;
   region='West'; date='01NOV2006'd; sales=2600000; output;
run;
data dec;
   region='East'; date='01DEC2006'd; sales=3100000; output;
   region='West'; date='01DEC2006'd; sales=3000000; output;
run;
data work.thirdqtr;
   set work.oct work.nov work.dec;
run;
proc print;
run;

data oct1;
   region='East'; sales=1600000; output;
   region='West'; sales=2100000; output;
run;
data nov1;
   region='East'; sales=2500000; output;
   region='West'; sales=2600000; output;
run;
data dec1;
   area='East'; sales=3100000; output;
   area='West'; sales=3000000; output;
run;
data work.thirdqtr1;
   set work.oct1 work.nov1 work.dec1;
run;
proc print;
run;

data divisionA;
   length name $ 10 state $ 2;
   name='Joy'; state='SC'; output;
   name='Tony'; state='NC'; output;
   name='Michael'; state='GA'; output;
   name='Margaret'; state='FL'; output;
run;
data divisionB;
   length name $ 15 location $ 2;
   name='Kelly'; location='CA'; output;
   name='Roger'; location='NV'; output;
   name='Mary Margaret'; location='TX'; output;
run;
data company;
   set divisionA divisionB;
run;
data company;
   length name $ 15;
   set divisionA(rename=(state=location)) divisionB;
   *length name $ 15;
run;
proc contents position;
run;
proc print;
run;

*** Interleaving ***;
proc sort data=divisionA;
   by name;
run;
proc sort data=divisionB;
   by name;
run;
data company;
   length name $ 15;
   set divisionA(rename=(state=location)) 
       divisionB;
   by name;
run;
proc print;
run;

proc sort data=divisionA;
   by descending state;
run;
proc sort data=divisionB;
   by descending location;
run;
data company;
   length name $ 15;
   set divisionA(rename=(state=location)) 
       divisionB;
   by descending location;
run;
proc print;
run;

*** Merging ***;
data revenue;
   length name $ 10;
   name='Joy'; revenue=15000; output;
   name='Tony'; revenue=25000; output;
   name='Michael'; revenue=18000; output;
   name='Margaret'; revenue=26000; output;
run;
data expense;
   length name $ 10;
   name='Joy'; expense=18000; output;
   name='Tony'; expense=19000; output;
   name='Michael'; expense=19000; output;
   name='Margaret'; expense=20000; output;
run;
proc sort data=revenue;
  by name;
proc sort data=expense;
  by name;
data combine;
   merge revenue expense;
   by name;
   profit=revenue-expense;
run;
proc print;
run;

data monrevenue;
   length name $ 10;
   name='Billy'; month='Apr'; revenue=5500; output;
   name='Billy'; month='May'; revenue=5500; output;
   name='Janet'; month='Apr'; revenue=6000; output;
   name='Janet'; month='May'; revenue=5000; output;
run;
data monexpense;
   month='Apr'; expense=5000; output;
   month='May'; expense=5500; output;
run;
proc sort data=monrevenue;
   by month;
data moncombine;
   merge monrevenue monexpense;
   by month;
   profit=revenue-expense;
run;
proc print;
run;

data revenue1;
   length name $ 10;
   name='Thomas'; revenue=15000; output;
   name='Caroline'; revenue=25000; output;
   name='Jack'; revenue=18000; output;
   name='Jenna'; revenue=26000; output;
run;
data expense1;
   length name $ 10;
   name='Thomas'; expense=18000; output;
   name='Caroline'; expense=19000; output;
   name='Susan'; expense=19000; output;
   name='Jenna'; expense=20000; output;
run;
proc sort data=revenue1;
   by name;
proc sort data=expense1;
   by name;
data combine1;
   merge revenue1(in=rev) 
         expense1(in=exp);
   by name;
   profit=revenue-expense;
run;
proc print;
run;

data revexp revonly exponly;
   merge revenue1(in=rev) 
         expense1(in=exp);
   by name;
   if rev=1 and exp=1 then output revexp;
   else if rev=1 and exp=0 then output revonly;
   else if rev=0 and exp=1 then output exponly;
run;
proc print;
run;

*** Exercise 5 ***;
data employees;
   length name $ 8;
   id='12649'; name='Troy'; output;
   id='38901'; name='Melissa'; output;
   id='49255'; name='Larry'; output;
   id='56391'; name='Tonya'; output;
run;
data salaries;
   idnum='12649'; salary='52000'; output;
   idnum='49255'; salary='75000'; output;
   idnum='56391'; salary='89000'; output;
   idnum='88376'; salary='66000'; output;
run;
data empsal;
   merge employees(in=emp rename=(id=idnum))
         salaries(in=sal);
   by idnum;
   if emp=1 and sal=1;
run;
proc print;
run;