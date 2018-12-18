proc sort data=orion.country out=country;
   by ContinentID;
run;

data countryinfo;
   merge country orion.continent;
   by ContinentID;
run;
