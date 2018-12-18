*** Defining and Referencing an Array ***;
data Weekly;
   input name $ week1 week2 week3 week4;
   datalines;
Jack 25 32 48 33
Susan 10 12 10 10
;
run;
proc print;
run;
data Increase;
   set Weekly;
   array run{4} week1 - week4;
   do week = 1 to 4;
      run{week} = run{week} * 1.10;
   end;
   drop week;
run;
proc print;
run;

data Stats;
   input name $ height $ weight $ blpres $ pulse $ chol $;
   datalines;
Jana Ave Ave Ave Ave Ave
Tyler Ave AboveAve AboveAve Ave AboveAve
William Ave Ave Ave Ave AboveAve
;
run;
data Stats2(drop=i);
   set Stats;
   count=0;
   array health{5} height weight blpres pulse chol;
   do i = 1 to 5;
      if health{i} = 'AboveAve' then count+1;
   end;
run;
proc print;
run;

*** Exercise 5 ***;
data WeeklyRotate;
   set Weekly;
   array run{4} week1 - week4;
   do week = 1 to 4;
      miles = run{week};
      output;
   end;
   drop week1 - week4;
run;
proc print;
run;

*** Creating Numeric Variables with an Array ***;
data WeeklyDiff(drop=week);
  set Weekly;
  array run{4} week1 - week4;
  array diff{3} diff21 diff32 diff43;
  do week = 1 to 3;
     diff{week} = run{week+1}-run{week};
  end;
run;
proc print;
run;

data WeeklyPct(drop=week);
   set Weekly;
   total=sum(of week1-week4);
   array run{4} week1 - week4;
   array pctwk{4};
   do week = 1 to 4;
      pctwk{week} = run{week}/total;
   end;
   format pctwk1-pctwk4 percent6.;
run;
proc print;
run;

*** Creating Character Variables with an Array ***;
data names;
   input first1 $ first2 $ first3 $;
   datalines;
janet russell cheryl
;
run;

data newnames(drop=i);
   set names;
   array first{3};
   array newfirst{3} $ 8;
   do i=1 to 3;
     newfirst{i}=propcase(first{i});
   end;
run;
proc print;
run;

*** Initial Values ***;
data score(drop=x);
   infile 'quiz.dat';
   input name $ q1 $ q2 $ q3 $ q4 $ q5 $;
   array answer{5} q1-q5;
   array correct{5} $ 1 ('A','B','A','D','C');
   score=0;
   do x=1 to 5;
     if answer{x}=correct{x} 
        then score+1;
   end;
run;
proc print;
run;

*** _TEMPORARY_ Option ***;
data score(drop=x);
   infile 'quiz.dat';
   input name $ q1 $ q2 $ q3 $ q4 $ q5 $;
   array answer{5} q1-q5;
   array correct{5} $ 1 _temporary_ ('A','B','A','D','C');
   score=0;
   do x=1 to 5;
     if answer{x}=correct{x} 
        then score+1;
   end;
run;
proc print;
run;
	 
data test;
  array revenue{3} _temporary_ (12 15 22);
  array revenue{3} _temporary_ 8 (12 15 22);
  array revenue{3} _temporary_ rev1-rev3 (12,15,22);
  array revenue{3} $ rev1-rev3 _temporary_ ('12','15','22');
run;
