

data country;
   drop rc;
   length ContinentName $ 30;   
   if _n_=1 then do;
      call missing(ContinentName);   
      declare hash ContName();
      ContName.definekey('ContinentID');
      ContName.definedata('ContinentName');
      ContName.definedone(); 
      ContName.add(key:91, data:'North America');
      ContName.add(key:93, data:'Europe');
      ContName.add(key:94, data:'Africa');
      ContName.add(key:95, data:'Asia');
      ContName.add(key:96, data:'Australia/Pacific');
   end;
   set orion.country(keep=ContinentID Country CountryName);
   rc=ContName.find();
run;
