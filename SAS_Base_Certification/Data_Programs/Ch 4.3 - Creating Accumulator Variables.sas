data MainePopulation(keep=MaineCounty Population2000);
   length MaineCounty $ 15; 
   input MaineCounty Population1990 Population2000;
   datalines;
Androscoggin 105259 103793 
Aroostook 86936 73938 
Cumberland 243135 265612 
Franklin 29008 29467 
Hancock 46948 51791 
Kennebec 115904 117114 
Knox 36310 39618 
Lincoln 30357 33616 
Oxford 52602 54755 
Penobscot 146601 144919 
Piscataquis 18653 17235 
Sagadahoc 33535 35214 
Somerset 49767 50888 
Waldo 33018 36280 
Washington 35308 33941 
York 164587 186742 
;
run;

*** Accumulating Total ***;
data MaineTotals;
   set MainePopulation;
   TotPopulation+Population2000;
   TotCounties+1;
run;
options ls=64;
proc print noobs split='*';
  format TotPopulation Population2000 comma12.;
  label MaineCounty='Maine*County'
        Population2000='Population*2000'
        TotPopulation='Total*Population'
        TotCounties='Total*Counties';
run;

*** RETAIN Statement ***;
data FiveYearPop(drop=Year);
   input Year Population;
   datalines;                                                               
1950 914950   
1955 940841   
1960 970689   
1965 993236   
1970 997357   
1975 1062640  
1980 1125027   
1985 1163850   
1990 1227928   
;
run;
data FiveYearPop;
   set FiveYearPop;
   retain Year 1945;
   Year+5;
run;
proc print noobs;
   var Year Population;
   format Population comma12.;
run;

*** BY-Group Processing ***;
data Top10Town;
   set project.Top10Town;
run;
proc sort data=Top10Town;
   by county town;
run;
data TopCounties;
   set Top10Town;
   by County;
   if first.County then TotalPopulation=0;
   TotalPopulation+Population;
   if last.County=1;
   keep County TotalPopulation;
run;
options ls=80;
proc print noobs;
run;

*** Multiple BY-Group Variables ***;
*** Exercise 3 ***;
data donations;
   length state $ 2 city $ 15;
   state='NC'; city='Charlotte';  donation=2000; output;
   state='NC'; city='Charlotte';  donation=9000; output;
   state='NC'; city='Charlotte';  donation=4000; output;
   state='NC'; city='Greenville'; donation=6000; output; 
   state='NC'; city='Greenville'; donation=3000; output; 
   state='SC'; city='Greenville'; donation=5000; output;
   state='SC'; city='Greenville'; donation=2000; output;
   state='SC'; city='Pelzer';     donation=5000; output;
run;
proc sort data=donations;
   by state city;
run;
data CityDonate;
    set Donations;
    by State City;
    if first.City=1 then TotalDonation=0;
    TotalDonation+Donation;
    if last.City;
run;
proc print;
run;



