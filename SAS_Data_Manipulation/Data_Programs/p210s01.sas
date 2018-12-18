/*********************/
/*  p307s01          */
/*********************/


/*******************/
/* Part A          */
/* Make continent. */
/*******************/

data continent;
   keep Start Label FmtName;
   retain FmtName 'continent';
   set orion.continent(rename=(Continent_ID=Start
                                 Continent_Name=Label));
run;

proc print data=continent(obs=10) noobs;
   title 'Continent';
run;

/***********************************/
/* Part B                          */
/* Use Continent to create format. */
/***********************************/

proc format library=orion.MyFmts cntlin=continent fmtlib;
   select continent;
   title 'Continent format';
run;

/*******************/
/* Part c          */
/* Use Continent.  */
/*******************/

options fmtsearch=(orion.MyFmts);

data countries;
   set orion.country;
   Continent_Name=put(Continent_ID, continent.);
run;

proc print data=countries(obs=10);
   title 'Continent Names';
run;


title;


/********************/
/* Part d           */
/* Update continent.*/
/********************/

proc format library=orion.Myfmts cntlout=continentfmt;
   select continent;
run;

data continentfmt;
	set continentfmt orion.NewContinent;
run;

proc format library=orion.Myfmts cntlin=continentfmt fmtlib;
   select Continent;
run;

title;
