/*********************/
/*  p210s03          */
/*********************/


data ages_mod;
   set orion.ages_mod(rename=(First_Age=Start Last_Age=End
                                Description=Label));
   retain fmtname 'ages_mod';
   EEXCL='Y'; 
run;

proc format library=orion.MyFmts fmtlib cntlin=ages_mod;
   select ages_mod;
run;

options fmtsearch=(orion.MyFmts);

data sales;
   set orion.sales(keep=Employee_ID Birth_Date);
   Age=int(yrdif(Birth_Date, today(), 'AGE'));
   Age_Cat=put(Age,ages_mod.);
run;

proc print data=sales(obs=5);
  format birth_date date9.;
  Title 'Sales Data Set';
run;

title;
