/*********************/
/*  p210s02          */
/*********************/


data ages;
   set orion.ages(rename=(First_Age=Start 
                            Last_Age=End Description=Label));
   retain FmtName 'ages';
run;

proc format library=orion.MyFmts fmtlib cntlin=ages;
   select ages;
run;

options fmtsearch=(orion.MyFmts);

data sales;
   set orion.sales(keep=Employee_ID Birth_Date);
   Age=int(yrdif(Birth_Date, today(), 'AGE'));
   Age_Cat=put(Age, ages.);
run;
options nodate nonumber;
proc print data=sales(obs=5);
  format Birth_Date date9.;
  title 'Sales Data Set';
run;

title;
