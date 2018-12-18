*m102s02;

title; 
footnote; 

/* Part A */
proc sort data=orion.continent out=sorted;                                                  
   by Continent_Name;
run;

/* Part B */
proc print data=&syslast;
   title "&syslast";                                                                                         
run;

title; 

