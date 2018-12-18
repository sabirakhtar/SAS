/*********************/
/*  p210e01c         */
/*********************/


/*******************/
/* Part C          */
/* Use continent.  */
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
