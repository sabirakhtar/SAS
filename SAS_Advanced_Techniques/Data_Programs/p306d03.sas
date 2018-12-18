data country;
   drop rc;
   length ContinentName $ 30;
   if _n_=1 then do;
      call missing(ContinentName);
      declare hash ContName(dataset: 'orion.continent');        
      ContName.definekey('ContinentID');
      ContName.definedata('ContinentName');
      ContName.definedone();                                             
   end;
   set orion.country(keep=ContinentID Country CountryName);
   rc=ContName.find(); 
run;

proc print data=country noobs;
   title 'Continent Descriptions';
run;
