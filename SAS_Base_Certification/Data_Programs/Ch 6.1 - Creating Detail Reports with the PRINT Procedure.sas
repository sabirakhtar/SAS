options nodate nonumber ps=30 ls=64;
proc print data=sashelp.shoes noobs split='*';
   var subsidiary product inventory sales;
   where product='Boot' or product='Sandal';
   sum inventory sales;
   by region;
   pageby region;
   label inventory='Total*Inventory'
         sales='Total*Sales';
   format inventory sales dollar14.2;
   title 'Boot and Sandal Report';
   footnote 'Created by Tony Smith';
   footnote2 'Chicago, IL';
run;

*** VAR Statement ***;
options nodate nonumber ps=30 ls=64;
proc print data=sashelp.shoes;
   var product stores returns;
   title;
   footnote;
run;

*** BY and PAGEBY Statements ***;
options nodate nonumber ps=30 ls=64;
proc print data=sashelp.shoes noobs;
   var product inventory sales;
   where region='United States';
   by region subsidiary;
   pageby subsidiary;
   title;
   footnote;
run;

*** FORMAT Statement ***;
data new1;
   input char $ num1 num2 num3 num4;
   datalines;
Washington 1234.4567 1234.4567 1234.4567 1234.4567
;
run;
proc print data=new1;
   format char $4. num1 8.0 num2 8.2 num3 comma8.2 num4 dollar8.2;
run;

data new2;
   date1='15jun2007'd; date2='15jun2007'd; date3='15jun2007'd;
   date4='15jun2007'd; date5='15jun2007'd; date6='15jun2007'd;
   date7='15jun2007'd; date8='15jun2007'd; date9='15jun2007'd;
run;
proc print data=new2;
   format date1 mmddyy6.  date2 mmddyy8.  date3 mmddyy10.
          date4 date7.    date5 date9.    date6 ddmmyy8.
	 	 date7 worddate. date8 weekdate. date9 monyy7.;
run;

data new3;
   birth='17feb1941'd;
   hired='01may1976'd;
   retired='31dec06'd;
run;
proc print data=new3;
   format birth hired mmddyy10. retired date9.;
run;

*** Exercise 2 ***;
options nonumber ps=30 ls=64;
proc print data=sashelp.prdsal2 noobs label;
   where country='Mexico';
   var country year predict actual;
   by descending country;
   sum predict actual;
   label predict='Predicted Sales'
         actual='Actual Sales';
   format predict actual dollar12.;
   title 'Predicted versus Actual Sales';
run;
