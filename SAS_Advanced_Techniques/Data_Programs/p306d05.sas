data country2;
   if 0 then set orion.continent;
   if _n_=1 then do;
      declare hash ContName(dataset:"orion.continent
                  (where=(ContinentName like 'A%'))");
      ContName.definekey('ContinentID');
      ContName.definedata('ContinentName');
      ContName.definedone();                                  
   end;
   set orion.country(keep=ContinentID Country
				  CountryName);
   if ContName.find()=0;
run;
